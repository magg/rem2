require 'test_helper'

class StoryTest < ActiveSupport::TestCase
	test "functionpts price must be positive" do
	  product = Story.new(:name => 'Conexion con Bancos', :status_id =>     '5', :descripcion => 'Deben de existir conexiones con las DB de los bancos', :prioridad => 'Media', :usuario => 'Lorena', :comentarios => 'Checar seguriad de Conexion')
	  product.functionpts = 1
	  assert product.valid?, "Si es mayor"
	end
end
