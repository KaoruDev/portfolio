require "redcarpet/render_strip"

class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id", required: true

  has_many :tags, as: :taggable, dependent: :destroy

  validates :title, :body, presence: true
  before_save :generate_slug, :set_published_at

  scope :published, -> {
    where("published_at < ? and draft is not true", Time.zone.now)
  }

  def plain_body
    without_images = body.to_s.gsub(/\!?\[.+\]\(.+\)/, "").gsub(/\s{2,}/, "")
    without_html = html_sanitizer.sanitize(without_images)
    markdown_render.render(without_html).strip
  end

  def banner
    md = body.to_s.match(/\!\[.+\]\((.+)\)/)
    md && md[1]
  end

  def generate_slug
    if slug.nil? || title_changed?
      time_stamp = published_at || created_at || Time.zone.now
      self.slug = "#{time_stamp.strftime("%m-%d-%Y")}-" \
        "#{CGI.escape(title.downcase.tr(" ", "-"))}"
    end
  end

  def set_published_at
    if !draft && published_at.nil?
      self.published_at = created_at || Time.zone.now
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
