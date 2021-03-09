class User < ApplicationRecord
    has_secure_password
    has_many :tomogatchis


    def instance_to_json
        {
           username: self.username
        }
    end 
end
