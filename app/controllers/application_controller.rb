class ApplicationController < ActionController::API

    # creates a token for us 
    def encode_token(payload)
        JWT.encode(payload, "whatever")
    end 


# decodes a token for us 
    def decode_token(token)
        JWT.decode(token, "whatever")
    end 



    def currentUser
        token = request.headers['Authorization']
        id = decode_token(token)[0]["id"]
        user = User.find_by(id:id)
    end 


    # JWT allows us to enocde specific informaiton ( in this case we want to encode the ID the user ) and makes it into this kinda of unreadable token that we can uuser to autherirze or make sure this is the spefic person we are tlaking about and

    #JWT comes back with 2 different methods.. JWT.encode(payload, secret) => it creates a token for us to use and play around with to send to the front end. 
    # {id: user.id}
    # JWT comes with JWT.decode(token, secret) => takes that token that was created and decodes it to it's original value
    # User.find(JWT.decode(token,secret))
end
