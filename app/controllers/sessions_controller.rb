class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = Usuario.authenticate(params[:username], params[:password])
      if user.tipo == "Admin"
         session[:user_id] = user.id
         redirect_to admin_admins_path
       elsif user.tipo == "Student"
         #session[:user_id] = user.id
         if params[:remember_me]
           cookies.permanent[:auth_token] = user.auth_token
         else
           cookies[:auth_token] = user.auth_token  
         end         
         redirect_to alumno_students_path
       elsif user.tipo == "Client"
         session[:user_id] = user.id
         redirect_to client_clients_path
      end
       else
         redirect_to login_url, :alert => "Invalid user/password combination"
       end
  end

  def destroy
     #session[:user_id] = nil
     cookies.delete(:auth_token)
     redirect_to login_url, :notice => "Logged out"
   end
end
