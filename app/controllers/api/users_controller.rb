class Api::UsersController < ApplicationController
    def index
      users = User.all 
      
      if users
        render json: {status: "SUCCESS", message: "Fetched all the users successfully", data: users}, status: :ok
      else
        render json: users.errors, status: :bad_request
      end
    end

    def create
      user = User.new(user_params)
      
      if user.save
        render json: {status: "SUCCESS", message: "user was created successfully!", data: user}, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def show
      user = User.find(params[:id])
  
      if user
        render json: {data: user}, state: :ok
      else
        render json: {message: "user could not be found"}, status: :bad_request
      end
    end
  
    def destroy
      user = User.find(params[:id])
  
      if user.destroy!
        render json: {message: "user was deleted successfully"}, status: :ok
      else
        render json: {message: "user does not exist"}, status: :bad_request
      end
    end
  
    def update
      user = User.find(params[:id])
  
      if user.update!(user_params)
        render json: {message: "user was updated successfully", data: user}, status: :ok
      else
        render json: {message: "user cannot be updated"}, status: :unprocessable_entity
      end
    end
      
    private
      
    def user_params
      params.require(:user).permit(:name, :phone, :email)
    end
end
