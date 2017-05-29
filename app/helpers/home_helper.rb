module HomeHelper
  # skills are arranged font-icon classname => "display name"
  DAILY_SKILLS = [
    [:svgs_java, "Java"],
    [:svgs_ruby, "Ruby"],
    [:svgs_javascript, "Javascript"],
    [:svgs_rails, "Rails"],
    [:svgs_react, "React"],
    [:svgs_postgresql, "Postgres"],
    [:svgs_hbase, "HBase"],
    [:svgs_kafka, "Kafka"],
    [:svgs_zookeeper, "Zookeeper"],
    [:svgs_sass, "Sass"],
    [:svgs_html5, "HTML5"],
    [:svgs_gulp, "Gulp"],
    [:svgs_aws, "AWS"],
    [:svgs_nginx, "nginx"],
    [:svgs_git, "Git"],
    [:svgs_github, "Github"],
    [:svgs_vim, "Vim"],
  ]

  FAMILIAR_SKILLS = [
    [:svgs_nodejs, "Node"],
    [:svgs_redis, "Redis"],
    [:svgs_d3js, "D3"],
    [:svgs_cassandra, "Cassandra"],
    [:svgs_docker, "Docker"],
    [:svgs_bash, "Bash"],
    [:elixir, "Elixir"],
    [:svgs_linux, "Linux"],
    [:svgs_jenkins, "Jenkins"],
  ]

  SKILL_TYPE = {
    daily: DAILY_SKILLS,
    familiar: FAMILIAR_SKILLS,
  }

  def list_skills(type)
    SKILL_TYPE[type].map do |(svg_name, skill_name)|
      "<div class=\"pull-left skill-container text-center\">" \
        "#{image_tag("#{parse_image_path(svg_name)}", class: "skill-icon")}" \
        "<br>" \
        "#{skill_name}</div>"
    end.join("").html_safe
  end

  def parse_image_path(image_name)
    File.join(image_name.to_s.split("_"))
  end
end
