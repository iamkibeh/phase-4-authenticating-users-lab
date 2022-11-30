class SessionsController < ApplicationController
    def create
        user  = User.find_by(username: params[:username])
        session[:user_id] ||= user.id
        render json: user
    end

    def destroy
        session.data[:user_id].delete 
        render json:{}, status: :no_content
    end
end
