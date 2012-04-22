class Admin::AdminsController < ApplicationController
  before_filter :authorize_admin
  
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @usuario = Usuario.new
    @admin = Admin.new
    @admin.usuario = @usuario
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
    @usuario = @admin.usuario
  end

  # POST /admins
  # POST /admins.json
  def create
    @usuario = Usuario.new(params[:admin][:usuario_attributes])
    @admin = Admin.new(params[:admin])
    @admin.usuario = @usuario

    respond_to do |format|
      if @admin.save
        format.html { redirect_to [:admin, @admin], notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin]) and
        @admin.usuario.update_attributes(params[:admin][:usuario_attributes])
        format.html { redirect_to [:admin, @admin], notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    id = @admin.usuario_id
    @usuario = Usuario.find(id)
    @usuario.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_admins_url }
      format.json { head :no_content }
    end
  end
  
  protected
    def authorize_admin
      #unless Usuario.find_by_id(session[:user_id])
      @projects = Project.all
        @admin = Usuario.find_by_auth_token( cookies[:auth_token])
        if @admin.tipo != "Admin"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end   
    end
end
