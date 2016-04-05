module HomeHelper
  # skills are arranged font-icon classname => "display name"
  DAILY_SKILLS = [
    [:ruby, "Ruby"],
    [:javascript, "Javascript"],
    [:rails, "Rails"],
    [:backbone, "Backbone"],
    [:jquery, "jQuery"],
    [:code, "RSpec"],
    [:heroku, "Heroku"],
    [:github, "Github"],
    [:bootstrap, "Bootstrap"],
    [:postgresql, "Postgres"],
    [:sass, "Sass"],
    [:html5, "HTML5"],
    [:css3, "CSS3"],
    [:gulp, "Gulp"],
    [:code, "Webpack JS"],
    [:git, "Git"],
    [:vim, "Vim"],
  ]

  FAMILIAR_SKILLS = [
    [:nodejs, "Node"],
    [:redis, "Redis"],
    [:react, "React"],
    [:d3js, "D3"],
    [:code, "Cassandra"],
    [:docker, "Docker"],
    [:nginx, "nginx"],
    [:code, "Bash"],
    [:code, "Elixir"],
    [:linux, "Unix / Linux"],
    [:travis, "Travis"],
    [:code, "Jenkins"],
    [:aws, "AWS"],
  ]

  SKILL_TYPE = {
    daily: DAILY_SKILLS,
    familiar: FAMILIAR_SKILLS,
  }

  def list_skills(type)
    SKILL_TYPE[type].map do |(svg_name, skill_name)|
      "<div class=\"pull-left skill-container text-center\">" \
       "#{image_tag("svgs/#{svg_name}", class: "skill-icon")}<br>" \
        "#{skill_name}</div>"
    end.join("").html_safe
  end
end
