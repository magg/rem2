class Admin::ClientsController < ApplicationController
  before_filter :authorize_admin
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @usuario = Usuario.new
    @client = Client.new
    @client.usuario = @usuario
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @usuario = @client.usuario
  end

  # POST /clients
  # POST /clients.json
  def create
    @usuario = Usuario.new(params[:client][:usuario_attributes])
    @client = Client.new(params[:client])
    @client.usuario = @usuario
    
    respond_to do |format|
      if @client.save
        format.html { redirect_to [:admin, @client], notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client]) and
        @client.usuario.update_attributes(params[:client][:usuario_attributes])
        format.html { redirect_to [:admin, @client], notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    id = @client.usuario_id
    @usuario = Usuario.find(id)
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to admin_clients_url }
      format.json { head :no_content }
    end
  end
  
  protected
     def authorize_admin
       #unless Usuario.find_by_id(session[:user_id])
         admin = Usuario.find_by_auth_token( cookies[:auth_token])
         if admin.tipo != "Admin"
           redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
         end
     end
  
end
