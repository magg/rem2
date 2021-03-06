class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_i18n_locale_from_params
  protect_from_forgery
  
  def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end
    
  protected
    def authorize
      #unless Usuario.find_by_id(session[:user_id])
      unless Usuario.find_by_auth_token( cookies[:auth_token]) or cookies[:auth_token]
        redirect_to login_url, :notice => "Please log in"
      end
    end
end
