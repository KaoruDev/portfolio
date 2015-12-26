module PageTitleHelper
  def page_title
    subtitle = if @post
      @post.title.to_s.capitalize
    else
      "Motivation | Code | Life"
    end

    "Kaoru K - #{subtitle}"
  end
end
