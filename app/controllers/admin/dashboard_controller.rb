class Admin::DashboardController < ApplicationController
  Dotenv::Railtie.load

  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASS']
    end
  end
  
  def show
  end
end
