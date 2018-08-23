class CreateTags < ActiveRecord::Migration[4.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps null: false
    end
  end
end
