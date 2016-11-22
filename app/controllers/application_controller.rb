class NotAuthorized < Exception

end

class ApplicationController < ActionController::Base

  before_filter :authenticate_basic, :unless => :json
  before_filter :current_user, :if => :json

  rescue_from ActiveRecord::RecordNotFound, :with => 404

protected
  def json
    request.format.json?
  end

  def authenticate_basic
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'secret'
    end
  end

  def current_user
    puts session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    head :unauthorized unless @current_user.present?
  end
end
