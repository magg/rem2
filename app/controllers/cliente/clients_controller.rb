class Cliente::ClientsController < ApplicationController
  before_filter :authorize_client
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    usuario = Usuario.find_by_auth_token( cookies[:auth_token])
    @id = usuario.id

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1/edit
  def edit
     client = Client.find(params[:id])     
     usuario = Usuario.find_by_auth_token( cookies[:auth_token])
     if client.usuario_id == usuario.id
       @client = client
       @usuario = @client.usuario
     else 
       redirect_to cliente_clients_path, :notice => "Usted no tiene permisos suficientes"
       
     end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    usuario = Usuario.find_by_auth_token( cookies[:auth_token])
    if @client.usuario_id == usuario.id
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to [:cliente, @client], notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  end

 protected
    def authorize_client
      #unless Usuario.find_by_id(session[:user_id])
        admin = Usuario.find_by_auth_token( cookies[:auth_token])
        if admin.tipo != "Client"
          redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
        end
    end
end
