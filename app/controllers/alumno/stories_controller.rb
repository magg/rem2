class Alumno::StoriesController < ApplicationController
  before_filter :authorize_student
  layout "student"
  # GET /stories
  # GET /stories.json
  def index
    if @team == nil
    else
      if params[:status] == nil
        @stories = Story.where(:project_id => @team.project_id)
        @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
        @proyecto = Project.where(:id=>@team.project_id).first
        
      else
  	if params[:status][:id]==""
  	  @stories = Story.where(:project_id => @team.project_id)
  	  @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
      @proyecto = Project.where(:id=>@team.project_id).first

  	else
  	  @statusid = params[:status][:id]
      @stories = Story.where("status_id = ? AND project_id = ?", params[:status][:id], @team.project_id)
  	  @statusid = params[:status][:id]
  	  @stories.sort! { |a,b| a.prioridad <=> b.prioridad }
      @proyecto = Project.where(:id=>@team.project_id).first

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
    @student = Student.where(:usuario_id => @session_student.id).first
    @team = Team.where(:id => @student.team_id).first
    @project_id = @team.project_id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end


  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @stat = Status.where(:id => @story.status_id).first.descripcion
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to [:alumno, @story], notice: 'La Story se creo correctamente.' }
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
        format.html { redirect_to [:alumno, @story], notice: 'La Story se actualizo correctamente.' }
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
      format.html { redirect_to alumno_stories_url }
      format.json { head :no_content }
    end
  end
 protected
    def authorize_student
      #unless Usuario.find_by_id(session[:user_id])
        @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
        @student = Student.where(:usuario_id => @session_student.id).first
        @team = Team.where(:id => @student.team_id).first
        if @session_student.tipo != "Student"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
