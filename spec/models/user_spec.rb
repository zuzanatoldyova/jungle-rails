require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
      @user = User.create(first_name: "Zuzana", last_name: "Toldyova", email: "test@test.ca", password: "1234", password_confirmation: "1234")
  end


  describe 'Validations' do

    it "validates that a user is created" do
      expect(@user).to be_persisted
    end

    it "doesn't validate a user with different password fields" do
      @user.password = "5678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "doesn't validate a user with no password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "doesn't validate a user with no password confirmation" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "doesn't allow to create a user with the same email (not case sensitive)" do
      @user2 = User.create(first_name: "Zuzana", last_name: "Toldyova", email: "TEST@TEST.ca", password: "1234", password_confirmation: "1234")
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "doeasn't allow an email to be empty" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "doeasn't allow first name to be empty" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "doeasn't allow last name to be empty" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "doeasn't allow password to be shorter than 4 characters" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do

    it 'returns user for authentication with correct credentials' do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end

    it 'returns nil for authentication with incorrect password' do
      expect(User.authenticate_with_credentials(@user.email, "4567")).to eq(nil)
    end

    it 'authenticates user if there are white spaces around inserted credentials' do
      expect(User.authenticate_with_credentials("  test@test.ca  ", "1234")).to eq(@user)
    end

    it 'authenticates user if different case for email is used' do
      expect(User.authenticate_with_credentials("TEST@TEST.ca", "1234")).to eq(@user)
    end

    it 'authenticates user created with uppercase email find by lowercase' do
      @user2 = User.create(first_name: "Zuzana", last_name: "Toldyova", email: "TEST2@TEST.ca", password: "1234", password_confirmation: "1234")
      expect(User.authenticate_with_credentials("test2@TEST.ca", "1234")).to eq(@user2)
    end
  end

end
