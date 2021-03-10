class TomogatchisController < ApplicationController

    def index
       tomogatchis = currentUser.tomogatchis
       if tomogatchis.empty?
            render json: {message: "User has no tomogatchis"}
       else 
           render json: {tomogatchis: tomogatchis}, status: :created
       end 
    end 
end
