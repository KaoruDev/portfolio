require "redcarpet/render_strip"

class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id", :required => true

  has_many :tags, :as => :taggable, :dependent => :destroy

  validates_presence_of :title, :body
  before_save :generate_slug, :set_published_at

  def plain_body
    without_images = body.to_s.gsub(/\!?\[.+\]\(.+\)/, '').gsub(/\s{2,}/, '')
    without_html = html_sanitizer.sanitize(without_images)
    markdown_render.render(without_html).strip
  end

  def banner
    md = body.to_s.match(/\!\[.+\]\((.+)\)/)
    md && md[1]
  end

  def generate_slug
    if self.slug.nil? || self.title_changed?
      time_stamp = self.published_at || self.created_at || Time.now
      self.slug = "#{time_stamp.strftime("%m-%d-%Y")}-#{CGI.escape(self.title.downcase.gsub(' ', '-'))}"
    end
  end

  def set_published_at
    if !self.draft && published_at.nil?
      self.published_at = self.created_at || Time.now
    end
  end

  private

  def html_sanitizer
    @html_sanitizer ||= Rails::Html::FullSanitizer.new
  end

  def markdown_render
    @markdown_render ||= Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  end


end
