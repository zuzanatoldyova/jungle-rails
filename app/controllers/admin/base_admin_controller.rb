class Admin::BaseAdminController < ApplicationController

  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']

end
