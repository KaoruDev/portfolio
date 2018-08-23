class AddSlugToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :slug, :string, :index => true, :unique => true
  end
end
