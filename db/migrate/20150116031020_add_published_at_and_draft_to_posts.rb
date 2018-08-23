class AddPublishedAtAndDraftToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :draft, :boolean
    add_column :posts, :published_at, :datetime
  end
end
