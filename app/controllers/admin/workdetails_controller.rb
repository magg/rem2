class Admin::WorkdetailsController < ApplicationController
  # GET /workdetails
  # GET /workdetails.json
  def index
    @workdetails = Workdetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdetails }
    end
  end

  # GET /workdetails/1
  # GET /workdetails/1.json
  def show
    @workdetail = Workdetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workdetail }
    end
  end

  # GET /workdetails/new
  # GET /workdetails/new.json
  def new
    @workdetail = Workdetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workdetail }
    end
  end

  # GET /workdetails/1/edit
  def edit
    @workdetail = Workdetail.find(params[:id])
  end

  # POST /workdetails
  # POST /workdetails.json
  def create
    @workdetail = Workdetail.new(params[:workdetail])

    respond_to do |format|
      if @workdetail.save
        format.html { redirect_to @workdetail, notice: 'Workdetail was successfully created.' }
        format.json { render json: @workdetail, status: :created, location: @workdetail }
      else
        format.html { render action: "new" }
        format.json { render json: @workdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workdetails/1
  # PUT /workdetails/1.json
  def update
    @workdetail = Workdetail.find(params[:id])

    respond_to do |format|
      if @workdetail.update_attributes(params[:workdetail])
        format.html { redirect_to @workdetail, notice: 'Workdetail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workdetails/1
  # DELETE /workdetails/1.json
  def destroy
    @workdetail = Workdetail.find(params[:id])
    @workdetail.destroy

    respond_to do |format|
      format.html { redirect_to workdetails_url }
      format.json { head :no_content }
    end
  end
end
