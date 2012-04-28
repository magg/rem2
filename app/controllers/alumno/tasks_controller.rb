class Alumno::TasksController < ApplicationController
  before_filter :authorize_student
  layout "student"
  # GET /tasks
  # GET /tasks.json
  def index
    @student = Student.where(:usuario_id => @session_student.id).first
    @team = Team.where(:id => @student.team_id).first
    @status_id = Status.where("descripcion = ?",'Listo')
    @stories = Story.where("status_id != ? AND project_id = ?", @status_id,@team.project_id);

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @storyname = Story.where(:id => @task.story_id).first.name
    @responsable = Student.where(:id => @task.student_id).first.nombre
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
      format.json { render json: @storyname }
    end
  end

  # GET /tasks/taskasign/1
  # GET /tasks/taskasign/1.json
  def taskasign
    @story = Story.find(params[:id])
    @stat = Status.where(:id => @story.status_id).first.descripcion
    @task = Task.new
    
    @student = Student.where(:usuario_id => @session_student.id).first
    @team_id = @student.team_id    
    respond_to do |format|
      format.html # taskasign.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @story = Story.find(@task.story_id)
    respond_to do |format|
      if @task.save
        format.html { redirect_to [:alumno, @task], notice: 'La tarea se creo correctamente' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "taskasign" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to [:alumno, Story.where(:id => @task.story_id).first], notice: 'La tarea se actualizo correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to [:alumno, Story.where(:id => @task.story_id).first] }
      format.json { head :no_content }
    end
  end
 protected
    def authorize_student
      #unless Usuario.find_by_id(session[:user_id])
        @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
        if @session_student.tipo != "Student"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
