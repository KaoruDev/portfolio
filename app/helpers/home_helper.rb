module HomeHelper
  # skills are arranged font-icon classname => "display name"
  DAILY_SKILLS = [
    [:svgs_java, "Java"],
    [:svgs_ruby, "Ruby"],
    [:svgs_javascript, "Javascript"],
    [:svgs_hbase, "HBase"],
    [:svgs_rails, "Rails"],
    [:svgs_hadoop, "Hadoop"],
    [:svgs_kafka, "Kafka"],
    [:svgs_zookeeper, "Zookeeper"],
    [:svgs_docker, "Docker"],
    [:svgs_kubernetes, "Kubernetes"],
    [:svgs_postgresql, "Postgres"],
    [:svgs_mongodb, "MongoDB"],
    [:svgs_aws, "AWS"],
    [:svgs_memcached, "Memcached"],
    [:svgs_elasticsearch, "ElasticSearch"],
    [:svgs_react, "React"],
    [:svgs_redux, "Redux"],
    [:svgs_jquery, "jQuery"],
    [:svgs_sass, "Sass"],
    [:svgs_css3, "CSS3"],
    [:svgs_heroku, "Heroku"],
    [:svgs_html5, "HTML5"],
    [:svgs_nginx, "nginx"],
    [:svgs_git, "Git"],
    [:svgs_github, "Github"],
    [:svgs_vim, "Vim"],
    [:svgs_linux, "Linux"],
  ]

  SKILL_TYPE = {
    daily: DAILY_SKILLS,
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
