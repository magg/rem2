class AddAuthTokenToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :auth_token, :string

  end
end
