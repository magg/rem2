#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. z
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
#---------------------
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.delete_all
Story.delete_all
Task.delete_all
Workdetail.delete_all
Student.delete_all
Criterio.delete_all
Sprint.delete_all
# . . .
Status.create(:descripcion => 'No Iniciado')
Status.create(:descripcion => 'Iniciado')
Status.create(:descripcion => 'Aceptado')
Status.create(:descripcion => 'No Aceptado')
Status.create(:descripcion => 'Listo')
# . . .
Story.create(:name => 'Log In Cliente', :status_id => '1', :descripcion => 'El sistema permite al cliente tener acceso haciendo useo de sus datos personales', :functionpts => '12', :prioridad => 'Alta', :usuario => 'Panchito', :comentarios => 'Hacer uso de Cifrado')

Story.create(:name => 'Checar Estado de Cuenta', :status_id => '2', :descripcion => 'El sistema le permite al cliente consultar informacion financiera', :functionpts => '87', :prioridad => 'Alta', :usuario => 'Laurita', :comentarios => 'Hacer dinamica la consulta')

Story.create(:name => 'Tareas del Administrador', :status_id => '5', :descripcion => 'El sistema le permite al administrador permitir o negar el accesos a cierto ususarios', :functionpts => '112', :prioridad => 'Baja', :usuario => 'Priscila', :comentarios => 'Desplegar la informacion de acuerdo a las prioridades')

Story.create(:name => 'Acciones del cajero', :status_id => '4', :descripcion => 'El cajero tiene varias operaciones disponibles', :functionpts => '90', :prioridad => 'Media', :usuario => 'Castas', :comentarios => 'Se debe desplegar una lista de las opciones del cajero')

Story.create(:name => 'Conexion con Bancos', :status_id => '5', :descripcion => 'Deben de existir conexiones con las DB de los bancos', :functionpts => '23', :prioridad => 'Media', :usuario => 'Lorena', :comentarios => 'Checar seguriad de Conexion')

# . . .

Task.create(:descripcion => 'El cliente crea usuario y contrasena', :estimadoinicial => '132', :status => '2', :story_id => '1', :student_id => '2')

Task.create(:descripcion => 'El cliente imprime estado de cuenta de hasta maximo 3 meses', :estimadoinicial => '49', :status => '2', :story_id => '2', :student_id => '1')

Task.create(:descripcion => 'Monitorieo', :estimadoinicial => '123', :status => '2', :story_id => '3', :student_id => '3')

Task.create(:descripcion => 'Desplegar Acciones del Cajero', :estimadoinicial => '93', :status => '5', :story_id => '4', :student_id => '1')

Task.create(:descripcion => 'Configuracion de Servidores de Peticiones', :estimadoinicial => '12', :status => '4', :story_id => '5', :student_id => '2')
# . . .
Workdetail.create(:task_id => '1', :hrstrabajadas => '12', :hrsporterminar => '33' )
Workdetail.create(:task_id => '2', :hrstrabajadas => '1', :hrsporterminar => '2' )
Workdetail.create(:task_id => '3', :hrstrabajadas => '32', :hrsporterminar => '12' )
Workdetail.create(:task_id => '4', :hrstrabajadas => '6', :hrsporterminar => '8' )
Workdetail.create(:task_id => '5', :hrstrabajadas => '2', :hrsporterminar => '8' )
# . . .
a = Usuario.create(:username => 'johnny', :password => '12345', :tipo => 'Student')
b = Usuario.create(:username => 'george', :password => '12345', :tipo => 'Student')
c = Usuario.create(:username => 'richy', :password => '12345', :tipo => 'Student')
# . . .
d = Student.create(:nombre => 'Juan', :appat => 'Salgado', :apmat => 'Perez', :rol => 'Desarrollador')
d.usuario = a
a.student = d
e = Student.create(:nombre => 'Jorge', :appat => 'Estrada', :apmat => 'Cruz', :rol => 'Calidad')
e.usuario = b
b.student = e
f = Student.create(:nombre => 'Rafael', :appat => 'Rodriguez', :apmat => 'Cortez', :rol => 'Arquitecto')
f.usuario = c
c.student = f
# . . .
Criterio.create(:descripcion => 'Checar la Calidad', :story_id => '1')
Criterio.create(:descripcion => 'Que sea Entendible', :story_id => '2')
Criterio.create(:descripcion => 'Que sea agil el proceso', :story_id => '2')
# . . .
Sprint.create(:comentario => 'Primera Entrega', :fechainicio => Date.parse("2012/05/12"), :fechafin => Date.parse("2012/06/12"))
Sprint.create(:comentario => 'Segunda Entrega', :fechainicio => Date.parse("2012/07/13"), :fechafin => Date.parse("2012/08/12"))
Sprint.create(:comentario => 'Tercera Entrega', :fechainicio => Date.parse("2012/08/13"), :fechafin => Date.parse("2012/09/12"))
# . . .

\
