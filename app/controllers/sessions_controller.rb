class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def destroy
        session.destroy
        redirect_to root_path
    end

    #login with a 3rd party signup
    def omniauth
      @user = User.find_or_create_by(uid: auth[:uid]) do |u|
          u.username = auth[:info][:email]
          u.password = SecureRandom.hex
          u.first_name = auth[:info][:first_name]
          u.last_name = auth[:info][:last_name]
        end
        if @user != nil
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = @user.errors.full_messages
          redirect_to login_path
        end
    end

    private

    def auth
      request.env['omniauth.auth']
    end
end