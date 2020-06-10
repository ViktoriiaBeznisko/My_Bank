class UsersController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @error = "Some information is missing or User already exist"
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def delete
        @user = User.find(params[:id])
        user.destroy
        redirect_to signin_path 
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :card_token, :card_type)
    end
end
