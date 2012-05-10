class Alumno::StatusesController < ApplicationController
  before_filter :authorize_student
  
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        format.html { redirect_to [:alumno, @status], notice: 'El estatus se creo correctamente.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to [:alumno, @status], notice: 'El estatus se actualizo correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to alumno_statuses_url }
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
      end              if @session_student.tipo != "Student"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
