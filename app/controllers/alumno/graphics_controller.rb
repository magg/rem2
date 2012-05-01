class Alumno::GraphicsController < ApplicationController
  before_filter :authorize_student
  layout "student" 
  # GET /graphics
  # GET /graphics.json
  def index
      @student = Student.where(:usuario_id => @session_student.id).first
      @team = Team.where(:id => @student.team_id).first
      @sprint = Sprint.joins(:stories).where(:stories => {:project_id => @team.project_id}).first
      date1 = @sprint.fechainicio
      date2 = @sprint.fechafin
      @as = (date1..date2).to_a
      @stories = Story.joins(:sprints).where(:sprints => {:id => @sprint.id})
      task=0
      @stories.each do |s|
        @tasks = Task.where(:story_id => s.id)
        @tasks.each do |t|
          task += t.estimadoinicial
          @works = Workdetail.where(:task_id => t.id)
        end
      end
      
       data_table = GoogleVisualr::DataTable.new
       data_table.new_column('string', 'Tiempo')
       data_table.new_column('number', 'Estimado inicial')
       data_table.new_column('number', 'Trabajo remanente')
       data_table.add_rows(@as.length)
       i=0
       
       tot =  task / Float(@as.length)
       @var = date2
       last=@as.last
       @as.each do |a|
       data_table.set_cell(i, 0, a.to_s)
       if i == 0 
        data_table.set_cell(i, 1, task)
       elsif a == last 
        data_table.set_cell(i, 1, 0)
       else    
        data_table.set_cell(i, 1, task-=tot)
       end
        i+=1
       end
       
       opts = { :width => 600, :height => 400, :title => 'Burndown chart', :legend => 'bottom' }
       @chart = GoogleVisualr::Interactive::LineChart.new(data_table, opts)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chart }
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
     def authorize_student
       #unless Usuario.find_by_id(session[:user_id])
         @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
         if @session_student.tipo != "Student"
           redirect_to login_url, :alert => "Usted no tiene permisos suficientes"
         end   
     end
end

 