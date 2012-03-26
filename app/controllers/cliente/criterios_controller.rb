class Cliente::CriteriosController < ApplicationController
  # GET /criterios
  # GET /criterios.json
  def index
    @criterios = Criterio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criterios }
    end
  end

  # GET /criterios/1
  # GET /criterios/1.json
  def show
    @criterio = Criterio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criterio }
    end
  end

  # GET /criterios/new
  # GET /criterios/new.json
  def new
    @criterio = Criterio.new

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
        format.html { redirect_to [:cliente, @criterio], notice: 'Criterio was successfully created.' }
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
        format.html { redirect_to [:cliente, @criterio], notice: 'Criterio was successfully updated.' }
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
      format.html { redirect_to criterios_url }
      format.json { head :no_content }
    end
  end
end
