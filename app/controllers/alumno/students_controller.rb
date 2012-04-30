class Alumno::StudentsController < ApplicationController
  before_filter :authorize_student
  layout "student"
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    usuario = Usuario.find_by_auth_token( cookies[:auth_token])
    #student = Student.where(:usuario_id => usuario.id)
    @id = usuario.id

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end


  # GET /students/1/edit
  def edit
     student = Student.find(params[:id])
     usuario = Usuario.find_by_auth_token( cookies[:auth_token])
     if student.usuario_id == usuario.id
       @student = student
       @usuario = @student.usuario
     else 
       redirect_to alumno_students_path, :notice => "Usted no tiene permisos suficientes"
       
     end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    usuario = Usuario.find_by_auth_token( cookies[:auth_token])
    if @student.usuario_id == usuario.id
      respond_to do |format|
        if @student.update_attributes(params[:student]) and 
          @student.usuario.update_attributes(params[:student][:usuario_attributes])
          format.html { redirect_to [:alumno, @student], notice: 'Student was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
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
