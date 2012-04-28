class Admin::TeamsController < ApplicationController
  before_filter :authorize_admin
  layout "admin"
  
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    @students = Student.where(:team_id => @team.id)
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to :action => "teamassign", :id => @team.id, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to edit_admin_team_path(@team)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def teamassign
    @team = Team.find(params[:id])
    @students = Student.where(:team_id => nil)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
      format.json { render json: @team }
    end
  end

  def assignmember
    @students = Student.find(params[:student])
    @team = Team.find(params[:team_id])
    @team.students << @students

   @students.each do |student|
      student.update_attribute(:team_id,@team.id)
    end

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
      format.json { head :no_content }
    end
  end

  def unassignmember
    @student = Student.find(params[:student_id])
    @team_id = @student.team_id
    @student.update_attribute(:team_id, nil)

    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => @team_id}
      format.json { head :no_content }
    end
  end




  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @students = Student.where(:team_id => @team.id)
    @students.each do |student|
      student.update_attribute(:team_id, nil)
    end
    @team.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
      format.json { head :no_content }
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
