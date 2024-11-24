class UsersController < ApplicationController
    def create
        # Store plain-text passwords
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save
          redirect_to root_path, notice: "User created successfully."
        else
          render :new
        end
      end
end
