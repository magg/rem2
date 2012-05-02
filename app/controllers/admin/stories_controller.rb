class Admin::StoriesController < ApplicationController
  before_filter :authorize_admin
  layout "admin"
  # GET /stories
  # GET /stories.json
  def index
    @project_id = params[:project_id]
    if params[:status] == nil
      @stories = Story.where(:project_id => @project_id)
      @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
    else
	if params[:status][:id]==""
	  @stories = Story.where(:project_id => @project_id)
	  @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
    
	else
	  @statusid = params[:status][:id]
          @stories = Story.where("status_id = ? AND project_id = ?", params[:status][:id], @project_id)
	  @statusid = params[:status][:id]
	  @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
    
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
         @projects = Project.all
         @projects.sort! { |a,b| a.nombre.downcase <=> b.nombre.downcase }
         @session_admin = Usuario.find_by_auth_token( cookies[:auth_token])
         if @session_admin.tipo != "Admin"
           redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
         end
     end
end
