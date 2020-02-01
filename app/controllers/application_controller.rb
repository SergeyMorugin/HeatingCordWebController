class ApplicationController < ActionController::Base
  before_action :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
       username == ENV['HTTP_BASIC_AUTHENTICATION_USERNAME'] && 
         password == ENV['HTTP_BASIC_AUTHENTICATION_PASSWORD']
    end
  end

end
