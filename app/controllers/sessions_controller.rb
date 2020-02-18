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
        binding.pry
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
          u.username = auth[:info][:email]
          u.password = SecureRandom.hex
        end

        if @user.valid?
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = @user.errors.full_messages
          redirect_to login_path
        end
    end

    private

    def auth
        binding.pry
      request.env['omniauth.auth']
    end
end