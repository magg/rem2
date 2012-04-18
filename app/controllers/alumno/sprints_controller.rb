class Alumno::SprintsController < ApplicationController
  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sprints }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
   @sprint = Sprint.find(params[:id])
   @stat = Status.find(5)
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
      story.update_attributes(:status_id => 5)
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
      story.update_attributes(:status_id => 2)
    end
    
    respond_to do |format|
        format.html { render action: "addsprint"}
        format.json { render json: @stories , notice: 'El Sprint se actualizo correctamente.' }
        format.json { render json: @notice }
    end
  end
 protected
    def authorize_admin
      #unless Usuario.find_by_id(session[:user_id])
        admin = Usuario.find_by_auth_token( cookies[:auth_token])
        if admin.tipo != "Student"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
