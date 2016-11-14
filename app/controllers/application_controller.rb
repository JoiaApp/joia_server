class ApplicationController < ActionController::Base
  #protect_from_forgery
  #http_basic_authenticate_with :name => "admin", :password => "secret"
  rescue_from ActiveRecord::RecordNotFound, :with => 404
protected
  def current_user
    puts session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    puts @current_user
  end
end
