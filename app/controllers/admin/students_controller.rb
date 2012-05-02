class Admin::StudentsController < ApplicationController
  before_filter :authorize_admin
  layout "admin"
    
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @usuario = Usuario.new
    @student = Student.new
    @student.usuario = @usuario
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @usuario = @student.usuario
  end

  # POST /students
  # POST /students.json
  def create
    @usuario = Usuario.new(params[:student][:usuario_attributes])
    @student = Student.new(params[:student])
    #@usuario.student = @student
    @student.usuario = @usuario
    
    respond_to do |format|
      if @student.save
        UserMailer.password_sent(params[:student][:usuario_attributes][:password],params[:student][:usuario_attributes][:username],params[:student][:usuario_attributes][:email]).deliver
        format.html { redirect_to [:admin, @student], notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student]) and
        @student.usuario.update_attributes(params[:student][:usuario_attributes])
        format.html { redirect_to [:admin, @student], notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    id = @student.usuario_id
    @usuario = Usuario.find(id)
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to admin_students_url }
      format.json { head :no_content }
    end
  end
  
  def upload
  end

  require 'csv'  
  def csv_import 
       data = params[:dump][:file].read
       @parsed_file=CSV.parse(data)
       n=0
       @parsed_file.each  do |row|
         stu = Student.new(:nombre => row[0])
         o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten  
         string  =  (0..50).map{ o[rand(o.length)]  }.join
         user = Usuario.new(:username => row[1], :password => string, :tipo => 'Student', :email => row[2])
         stu.usuario = user       
         if stu.save
           UserMailer.password_sent(string,row[1],row[2]).deliver
           n=n+1
           GC.start if n%50==0
         end
     end
     respond_to do |format|
       format.html { redirect_to admin_students_url, notice: "Archivo CSV procesado,  #{n} estudiantes han sido agregados" }
       format.json { render json: @student, status: :created, location: @student }
     end
   end
  
  protected
     def authorize_admin
       #unless Usuario.find_by_id(session[:user_id])
         @projects = Project.all
         @session_admin = Usuario.find_by_auth_token( cookies[:auth_token])
         if @session_admin.tipo != "Admin"
           redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
         end
     end
end
