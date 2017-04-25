module PageTitleHelper
  def page_title
    subtitle = if @post
      @post.title.to_s.capitalize
    elsif @title
      @title
    else
      "Software Engineer - Kaoru K"
    end

    "Kaoru K - #{subtitle}"
  end
end
