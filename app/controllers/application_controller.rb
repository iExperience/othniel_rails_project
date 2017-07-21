class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #session[:user_id] = nil
end
