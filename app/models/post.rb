class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :required => true

  has_many :tags, :as => :taggable, :dependent => :destroy

  validates_presence_of :title, :body
  before_save :generate_slug, :set_published_at

  def generate_slug
    if self.slug.nil?
      time_stamp = self.published_at || self.created_at || Time.now
      self.slug = "#{time_stamp.strftime("%m-%d-%Y")}-#{self.title.downcase.gsub(' ', '-')}"
    end
  end

  def set_published_at
    if !self.draft && published_at.nil?
      self.published_at = self.created_at || Time.now
    end
  end

end
