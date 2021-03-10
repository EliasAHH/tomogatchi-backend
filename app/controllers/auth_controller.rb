class AuthController < ApplicationController

    def login 
        user = User.find_by(username: params[:user][:username])
        if  user && user.authenticate(params[:user][:password])
            token = encode_token({id: user.id})
            render json: { user: user.instance_to_json, jwt: token }, status: :created
        else 
            render json: user.errors, status: :unprocessable_entity
        end 
    end
    
    def autologin 
        # we have to get the information from our FE and get the token that's there and RETURN that token and decode it to find the user that corresponds to that token . We are then going to create a NEW token and send it to the fe along with the user information
        # found the token
        token = request.headers['Authorization']
        # decoded the token to get the ID
        id = decode_token(token)[0]["id"]
        # we found the user
        user = User.find(id)
        # we created a new token 
        new_token = encode_token({id: user.id})
        #sent the new token and user information back to the FE 
        render json: { user: user.instance_to_json, jwt: token }, status: :created
    end 

private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
 