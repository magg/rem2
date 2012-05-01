class Admin::GraphicsController < ApplicationController
  before_filter :authorize_admin
  layout "admin" 
  # GET /graphics
  # GET /graphics.json
  def index
      @projects = Project.all
      @statuses = Status.all
      i = 0
      j=0
      cont=0
      graphs = Array.new(@projects.length)
      @charts = Array.new(@projects.length)              
      @projects.each do |p|
        graphs[j] = GoogleVisualr::DataTable.new
        graphs[j].new_column('string', 'Estatus')  
        graphs[j].new_column('number', 'Hours per Day')
        graphs[j].add_rows(4)
        graphs[j].set_cell(0, 0, 'No Iniciado' )
        graphs[j].set_cell(1, 0, 'Aceptado' )
        graphs[j].set_cell(2, 0, 'No Aceptado' )
        graphs[j].set_cell(3, 0, 'Listo' )
        @statuses.each do |st|
          s = Story.where("status_id = ? AND project_id = ?", st.id, p.id)
          graphs[j].set_cell(i, 1, s.length )
          cont+=s.length
          i+=1
        end
        opts = { :width => 600, :height => 400, :title => p.nombre + ' - Total Features: '+ cont.to_s, :colors => ['#dc3912', '#109618', '#ff9900', '#3366cc'], :is3D => true, :backgroundColor => '#f5f5f5' }
        @charts[j] = GoogleVisualr::Interactive::PieChart.new(graphs[j], opts)
        i = 0
        cont = 0
        j+=1
     end
      
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charts }
    end
  end

  # GET /graphics/1
  # GET /graphics/1.json
  def show
    @graphic = Graphic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graphic }
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

 