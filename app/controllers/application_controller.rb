class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :require_login, :list_creater
    add_flash_types :info, :error, :warning

    def logged_in?
        !!current_user
    end
  
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def hello
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    #find a user created the list by List :id
    def list_creater(id)
        @list_creater ||= User.find(List.find(id).user_id).username
    end

    
end
