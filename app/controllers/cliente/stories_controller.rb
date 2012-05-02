class Cliente::StoriesController < ApplicationController
  before_filter :authorize_client
  layout "client"
  # GET /stories
  # GET /stories.json
  def index
    if(@projects.count > 0)
    
        @project_id = params[:project_id]
        if params[:project_id] == nil
          @first_project = @projects.first
          @project_id = @first_project.id
          @stories = Story.where(:project_id => @first_project.id)
          @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
        else
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
      end
end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
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


  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end


  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to [:cliente, @story], notice: 'La Story se creo correctamente.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to [:cliente, @story], notice: 'La Story se actualizo correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to cliente_stories_url }
      format.json { head :no_content }
    end
  end
 protected
    def authorize_client
      #unless Usuario.find_by_id(session[:user_id])
        @session_client = Usuario.find_by_auth_token( cookies[:auth_token])
        if @session_client.tipo != "Client"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
        @client = Client.where(:usuario_id => @session_client.id).first
        @projects = Project.where(:client_id => @client.id)
    end
end
