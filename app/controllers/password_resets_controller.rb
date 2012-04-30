class PasswordResetsController < ApplicationController
  layout "login"
  skip_before_filter :authorize
  
  def new
  end
  
  def create
    user = Usuario.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to login_url, :alert => "Email sent with password reset instructions."
  end
  
  def edit
    @user = Usuario.find_by_password_reset_token!(params[:id])
  end
  
  def update
       @user = Usuario.find_by_password_reset_token!(params[:id])
        if @user.password_reset_sent_at < 2.hours.ago
         redirect_to new_password_reset_path, :alert => "Password reset has expired."
       elsif @user.update_attributes(params[:usuario])
        redirect_to login_url, :alert => "Password has been reset."
    else
        render :edit
        end
  end
end
