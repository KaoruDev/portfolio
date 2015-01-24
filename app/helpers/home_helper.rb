module HomeHelper
  # skills are arranged font-icon classname => "display name"
  DAILY_SKILLS = [
    [:ruby, "Ruby"],
    [:javascript_badge, "Javascript"],
    [:backbone, "Backbone"],
    [:jquery, "jQuery"],
    [:code, "RSpec"],
    [:code, "TestUnit"],
    [:heroku, "Heroku"],
    [:github_badge, "Github"],
    [:bootstrap, "Bootstrap"],
    [:sass, "Sass"],
    [:html5, "HTML"]
  ]

  FAMILIAR_SKILLS = [
    [:gulp, "Gulp"],
    [:grunt, "Grunt"],
    [:nodejs, "Node"],
    [:bower, "Bower"],
    [:requirejs, "Require JS"],
    [:redis, "Redis"],
    [:postgresql, "Postgres"],
    [:terminal, "Bash"]
  ]

  WANTED_SKILLS = [
    [:go, "Go"],
    [:scala, "Scala"],
    [:linux, "Linux"],
    [:nginx, "nginx"],
    [:travis, "Travis"],
    [:jenkins, "Jenkins"],
    [:terminal, "Unix"],
    [:terminal, "Capistrano"],
    [:terminal, "Fabric"],
    [:terminal, "Apache / Spark"]
  ]

  SKILL_TYPE = {
    daily: DAILY_SKILLS,
    familiar: FAMILIAR_SKILLS,
    wanted: WANTED_SKILLS
  }


  def list_skills(type)
    SKILL_TYPE[type].map do |(icon_name, display_name)|
      "<div class=\"skill\"><i class=\"devicons devicons-#{icon_name}\"></i><br><span>#{display_name}</span></div>"
    end.join("").html_safe
  end
end
