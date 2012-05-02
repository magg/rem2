class Alumno::SprintsController < ApplicationController
  before_filter :authorize_student
  layout "student"
  
  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.all
    @student = Student.where(:usuario_id => @session_student.id).first
    @team = Team.where(:id => @student.team_id).first
    @proyecto = Project.where(:id=>@team.project_id).first
    @sprints = Sprint.joins(:stories).where(:stories => {:project_id => @team.project_id})
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sprints }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
   @sprint = Sprint.find(params[:id])
   @stat = Status.find(4)
   @stories = Story.where("status_id = ?", @stat.id)
   @examples = @sprint.stories 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/new
  # GET /sprints/new.json
  def new
    @sprint = Sprint.new
    #@sprint.sprintstories.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
    @sprint = Sprint.find(params[:id])
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(params[:sprint])

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to [:alumno, @sprint], notice: 'El Sprint se creo correctamente.' }
        format.json { render json: @sprint, status: :created, location: @sprint }
      else
        format.html { render action: "new" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.json
  def update
    @sprint = Sprint.find(params[:id])

    respond_to do |format|
      if @sprint.update_attributes(params[:sprint])
        format.html { redirect_to [:alumno, @sprint], notice: 'El Sprint se actualizo correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint = Sprint.find(params[:id])
    @stories = @sprint.stories
    @stories.each do |story|
      story.update_attribute(:status_id , 4)
    end
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to alumno_sprints_url }
      format.json { head :no_content }
    end
  end
  
  def addsprint
    @stories = Story.find(params[:story])
    @sprint = Sprint.find(params[:sprintid])
    @sprint.stories << @stories
    @notice = 'El Sprint se actualizo correctamente.'
    @stories.each do |story|
      story.update_attribute(:status_id , 2)
    end
    
    respond_to do |format|
        format.html { render action: "addsprint"}
        format.json { render json: @stories , notice: 'El Sprint se actualizo correctamente.' }
        format.json { render json: @notice }
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
