module PageTitleHelper
  def page_title
    subtitle = if @post
      @post.title.to_s.capitalize
    elsif @title
      @title
    else
      "Mentorship | Code | Culture"
    end

    "Kaoru K - #{subtitle}"
  end
end
