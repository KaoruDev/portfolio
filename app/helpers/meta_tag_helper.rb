module MetaTagHelper
  def page_title
    subtitle = if @post
      @post.title.to_s.capitalize
    elsif @title
      @title
    else
      "Software Engineer"
    end

    "Kaoru K - #{subtitle}"
  end

  def page_description
    %{
Software Engineer based in the Bay Area, San Francisco. Helping companies turn
ideas into amazon products. I write about technical and personal learnings as I
advance through my career and life.
    }.squish
  end

  def page_keywords
    keywords = @post&.tags&.map(&:name) || []

    (keywords + %w{
      software
      engineer
      technical
      writing
      java
      ruby
      javascript
    }).join(", ")
  end
end
