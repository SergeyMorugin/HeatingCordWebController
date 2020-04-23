class ApplicationController < ActionController::Base
  before_action :authenticate, if: :production_mode?

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_AUTHENTICATION_USERNAME'] && 
      password == ENV['HTTP_BASIC_AUTHENTICATION_PASSWORD']
    end
  end

  def production_mode?
  	Rails.env.production?
   end 	

end
