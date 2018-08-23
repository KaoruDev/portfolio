class DropImages < ActiveRecord::Migration[5.2]
  def up
    drop_table :images
  end

  def down
    create_table :images do |t|
      t.string :name
      t.string :file

      t.timestamps null: false
    end
  end
end
