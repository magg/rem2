class AddComentariosToStories < ActiveRecord::Migration
  def change
    add_column :stories, :comentarios, :text

  end
end
