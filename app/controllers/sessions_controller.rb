class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = Usuario.authenticate(params[:username], params[:password])
      if user.tipo = "Admin"
         session[:user_id] = user.id
         redirect_to admin_admins
       elsif user.tipo = "Student"
         session[:user_id] = user.id
         redirect_to alumno_students
       elsif user.tipo = "Client"
         session[:user_id] = user.id
         redirect_to client_clients
      end
       else
         redirect_to login_url, :alert => "Invalid user/password combination"
       end
  end

  def destroy
     session[:user_id] = nil
     redirect_to store_url, :notice => "Logged out"
   end
end
