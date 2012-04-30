# encoding: utf-8
require "prawn"

class Alumno::ReportsController < ApplicationController
  before_filter :authorize_student

  def productbacklog
    send_data(generate_pdf_productbacklog, :filename => "pb.pdf", :type => "application/pdf") 
  end
  
  def criterios
    send_data(generate_pdf_criterios, :filename => "criterios.pdf", :type => "application/pdf") 
  end
  
  def sprints
    send_data(generate_pdf_sprints, :filename => "sprints.pdf", :type => "application/pdf") 
  end

  private 
  def generate_pdf_productbacklog
    pdf = Prawn::Document.new
          pdf.text "Documento de especificación", :align => :right,:style => :italic
          pdf.text "de requerimientos", :align => :right,:style => :italic
          pdf.move_down 20
          pdf.font_size(20) {pdf.text "Herramienta para administrar proyectos de", :align => :center,:style => :bold_italic}
          pdf.font_size(20) {pdf.text "SCRUM", :align => :center,:style => :bold_italic}
          pdf.move_down 40
          @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
          @student = Student.where(:usuario_id => @session_student.id).first
          @team = Team.where(:id => @student.team_id).first
          @stories = Story.where(:project_id => @team.project_id)
          @stories.each_with_index do |story,index|
            pdf.span(350, :position => :center) do
            pdf.text "Req. " + (index+1).to_s + ".- " + story.descripcion, :size => 14
            pdf.move_down 50
          end
        end
        pdf.repeat(:all, :dynamic => true) do
           pdf.draw_text pdf.page_number, :at => [500, 0]
         end
      pdf.render
  end

  def generate_pdf_criterios
    pdf = Prawn::Document.new
          pdf.text "Especificación de Criterios de aceptación", :align => :right,:style => :italic
          pdf.move_down 20
          pdf.font_size(20) {pdf.text "Herramienta para administrar proyectos de", :align => :center,:style => :bold_italic}
          pdf.font_size(20) {pdf.text "SCRUM", :align => :center,:style => :bold_italic}
          pdf.move_down 40
          @session_student = Usuario.find_by_auth_token( cookies[:auth_token])
          @student = Student.where(:usuario_id => @session_student.id).first
          @team = Team.where(:id => @student.team_id).first
          @stories = Story.where(:project_id => @team.project_id)
          @stories.each_with_index do |story,index|
            pdf.span(350, :position => :center) do
            pdf.text story.descripcion, :size => 14
            pdf.move_down 10
          end
            @criterios = Criterio.where(:story_id => story.id)
            pdf.span(350, :position => :center) do
            @criterios.each do |criterio|
              pdf.text "- " + criterio.descripcion, :size => 14
            end
        end
        pdf.move_down 20
      end
        pdf.repeat(:all, :dynamic => true) do
           pdf.draw_text pdf.page_number, :at => [500, 0]
         end
      pdf.render 
  end
  
  
  def generate_pdf_sprints
    pdf = Prawn::Document.new
          pdf.text "Relación de Stories y Sprints", :align => :right,:style => :italic
          pdf.move_down 20
          pdf.font_size(20) {pdf.text "Herramienta para administrar proyectos de", :align => :center,:style => :bold_italic}
          pdf.font_size(20) {pdf.text "SCRUM", :align => :center,:style => :bold_italic}
          pdf.move_down 40
          @student = Student.where(:usuario_id => @session_student.id).first
          @team = Team.where(:id => @student.team_id).first
          @sprints = Sprint.joins(:stories).where(:stories => {:project_id => @team.project_id})
          pdf.span(350, :position => :center) do
          @sprints.each_with_index do |sprint,index|
            pdf.text sprint.comentario, :size => 14
            pdf.move_down 10
            @stories = Story.joins(:sprints).where(:sprints => {:id => sprint.id})
            @stories.each do |story|
              pdf.text "- " + story.descripcion, :size => 14
            end
            pdf.move_down 20
          end
        end
        pdf.repeat(:all, :dynamic => true) do
           pdf.draw_text pdf.page_number, :at => [500, 0]
         end
      pdf.render 
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
