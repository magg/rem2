class Admin::StoriesController < ApplicationController
  before_filter :authorize_admin
  
  # GET /stories
  # GET /stories.json
  def index
    if params[:status] == nil
      @stories = Story.all
    else
	if params[:status][:id]==""
	  @stories = Story.all
	else
	  @statusid = params[:status][:id]
          @stories = Story.where(:status_id => params[:status][:id])
	  @statusid = params[:status][:id]
        end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
      format.json { render json: @statusid }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
    @stat = Status.where(:id => @story.status_id).first.descripcion
    @criterios = Criterio.where(:story_id => @story.id)
    @tasks = Task.where(:story_id => @story.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
      format.json { render json: @criterios }
      format.json { render json: @tasks }
    end
  end
  
  protected
     def authorize_admin
       #unless Usuario.find_by_id(session[:user_id])
         admin = Usuario.find_by_auth_token( cookies[:auth_token])
         if admin.tipo != "Admin"
           redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
         end
     end
end
