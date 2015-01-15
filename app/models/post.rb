class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :required => true

  has_many :tags, :as => :taggable

  validates_presence_of :title, :body
end
