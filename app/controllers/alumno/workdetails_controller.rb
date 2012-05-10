class Alumno::WorkdetailsController < ApplicationController
  before_filter :authorize_student
  layout "student"
  # GET /workdetails
  # GET /workdetails.json
  def index
     @workdetails = Workdetail.where("task_id = ?", params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdetails }
    end
  end

  # GET /workdetails/1
  # GET /workdetails/1.json
  def show
    @workdetails = Workdetail.where("task_id = ?", params[:id])
    @taskid = params[:id]
    @task = Task.where(:id => @taskid).first
    @storyid = @task.story_id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workdetails }
    end
  end

  # GET /workdetails/new
  # GET /workdetails/new.json
  def new
    @workdetail = Workdetail.new
    @taskid = params[:task_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workdetail}
    end
  end

  # GET /workdetails/1/edit
  def edit
    @workdetail = Workdetail.find(params[:id])
    @taskid = @workdetail.task_id
  end

  # POST /workdetails
  # POST /workdetails.json
  def create
    @workdetail = Workdetail.new(params[:workdetail])
    @taskid = @workdetail.task_id
    respond_to do |format|
      if @workdetail.save
        format.html { redirect_to :action => "show", :id => @taskid, notice: 'Workdetail was successfully created.' }
        format.json { render json: @workdetail, status: :created, location: @workdetail }
      else
        format.html { render action: "new" }
        format.json { render json: @workdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workdetails/1
  # PUT /workdetails/1.json
  def update
    @workdetail = Workdetail.find(params[:id])
    @taskid = @workdetail.task_id
    respond_to do |format|
      if @workdetail.update_attributes(params[:workdetail])
        format.html { redirect_to :action => "show", :id => @taskid, notice: 'Workdetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workdetails/1
  # DELETE /workdetails/1.json
  def destroy
    @workdetail = Workdetail.find(params[:id])
    @workdetail.destroy
    @taskid = @workdetail.task_id
    respond_to do |format|
      format.html { redirect_to :action => "show", :id => @taskid }
      format.json { head :no_content }
    end
  end
  protected
    def authorize_student
      #unless Usuario.find_by_id(session[:user_id])
      @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
      @student = Student.where(:usuario_id => @session_student.id).first
      @team = Team.where(:id => @student.team_id).first
        if @team != nil 
        @proyecto = Project.where(:id=>@team.project_id).first
      end        if @session_student.tipo != "Student"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
