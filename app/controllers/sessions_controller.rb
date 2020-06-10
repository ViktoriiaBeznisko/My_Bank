class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else 
            @user = User.find_by(name: params[:user][:name])        
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id

                redirect_to user_path(@user)
            else
                @error = "Incorrect information. Please try again"
                render 'sessions/new'
            end
        end
    end

    def signout
        session.clear
        redirect_to root_path
    end
end
