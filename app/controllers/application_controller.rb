class NotAuthorized < Exception
end

class ApplicationController < ActionController::Base

  before_filter :authenticate_basic, :unless => :json
  before_filter :current_user, :if => :json

  rescue_from ActiveRecord::RecordNotFound, :with => 404

  def about
  end

protected

  def json
    request.format.json?
  end

  def authenticate_basic
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PW']
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    head :unauthorized unless @current_user.present?
  end

end
