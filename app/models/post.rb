class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :required => true

  has_many :tags, :as => :taggable, :dependent => :destroy

  validates_presence_of :title, :body
  before_save :generate_slug

  def generate_slug
    time_stamp = self.published_at || self.created_at || Time.now
    self.slug = "#{self.title.downcase.gsub(' ', '-')}-#{time_stamp.to_i}"
  end

end
