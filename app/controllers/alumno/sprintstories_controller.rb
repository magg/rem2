class Alumno::SprintstoriesController < ApplicationController
  # GET /sprintstories
  # GET /sprintstories.json
  def index
    @sprintstories = Sprintstory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sprintstories }
    end
  end

  # GET /sprintstories/1
  # GET /sprintstories/1.json
  def show
    @sprintstory = Sprintstory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sprintstory }
    end
  end

  # GET /sprintstories/new
  # GET /sprintstories/new.json
  def new
    @sprintstory = Sprintstory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sprintstory }
    end
  end

  # GET /sprintstories/1/edit
  def edit
    @sprintstory = Sprintstory.find(params[:id])
  end

  # POST /sprintstories
  # POST /sprintstories.json
  def create
    @sprintstory = Sprintstory.new(params[:sprintstory])

    respond_to do |format|
      if @sprintstory.save
        format.html { redirect_to [:alumno, @sprintstory], notice: 'Sprintstory was successfully created.' }
        format.json { render json: @sprintstory, status: :created, location: @sprintstory }
      else
        format.html { render action: "new" }
        format.json { render json: @sprintstory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sprintstories/1
  # PUT /sprintstories/1.json
  def update
    @sprintstory = Sprintstory.find(params[:id])

    respond_to do |format|
      if @sprintstory.update_attributes(params[:sprintstory])
        format.html { redirect_to [:alumno, @sprintstory], notice: 'Sprintstory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sprintstory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprintstories/1
  # DELETE /sprintstories/1.json
  def destroy
    @sprintstory = Sprintstory.find(params[:id])
    @sprintstory.destroy

    respond_to do |format|
      format.html { redirect_to sprintstories_url }
      format.json { head :no_content }
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
