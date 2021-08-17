class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    
    def new  
        @user = User.new
        @users = User.all
    end 
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome back to the theme park!"
        else
          redirect_to signin_path
        end
    end
    

    
    def destroy 
        session.clear  
        redirect_to '/'
    end 

       
  end