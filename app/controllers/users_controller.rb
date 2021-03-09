class UsersController < ApplicationController

    def create 
        user = User.new(user_params)
        if user.save
            token = encode_token({id: user.id})
            render json: { user: user.instance_to_json, jwt: token }, status: :created
        else 
            render json: user.errors, status: :unprocessable_entity
        end 
    end 

private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
 