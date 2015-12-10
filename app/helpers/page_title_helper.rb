module PageTitleHelper
  def page_title
    subtitle = if @post
      @post.title.capitalize
    else
      "Motivation | Code | Life"
    end

    "Kaoru K - #{subtitle}"
  end
end
