class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :required => true

  has_many :tags, :as => :taggable, :dependent => :destroy

  validates_presence_of :title, :body
  before_save :generate_slug

  def generate_slug
    self.slug = "#{self.title.downcase.gsub(' ', '-')}-#{Time.now.to_i}"
  end

end
