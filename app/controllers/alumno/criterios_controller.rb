class Alumno::CriteriosController < ApplicationController
  before_filter :authorize_student
  layout "student"
  # GET /criterios/new
  # GET /criterios/new.json
  def new
    @criterio = Criterio.new
    @story_id = params[:story_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criterio }
    end
  end

  # GET /criterios/1/edit
  def edit
    @criterio = Criterio.find(params[:id])
  end

  # POST /criterios
  # POST /criterios.json
  def create
    @criterio = Criterio.new(params[:criterio])

    respond_to do |format|
      if @criterio.save
        format.html { redirect_to [:alumno, Story.where(:id => @criterio.story_id).first], notice: 'Criterio was successfully created.' }
        format.json { render json: @criterio, status: :created, location: @criterio }
      else
        format.html { render action: "new" }
        format.json { render json: @criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /criterios/1
  # PUT /criterios/1.json
  def update
    @criterio = Criterio.find(params[:id])

    respond_to do |format|
      if @criterio.update_attributes(params[:criterio])
        format.html { redirect_to [:alumno, Story.where(:id => @criterio.story_id).first], notice: 'Criterio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterios/1
  # DELETE /criterios/1.json
  def destroy
    @criterio = Criterio.find(params[:id])
    @criterio.destroy

    respond_to do |format|
      format.html { redirect_to [:alumno, Story.where(:id => @criterio.story_id).first] }
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
