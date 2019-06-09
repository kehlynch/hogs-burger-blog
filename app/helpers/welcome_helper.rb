module WelcomeHelper
  def display_rating(post)
    post.rating.times.collect do
      content_tag(:div, class: "col-1 pr-0 pl-0 burger-icon") do
        burger()
      end
    end.join.html_safe
  end

  def burger
    image_tag("burger.png", class: "img-fluid")
  end

  def sort_link(column, title = nil)
    puts "***sort_link***"
    title ||= column
    next_dir_lookup = {
      "" => "asc",
      "asc" => "desc",
      "desc" => ""
    }
    dir = column == sort_column ? sort_direction : ""
    next_dir = next_dir_lookup[dir]
    classname = dir == "" ? "none" : dir
    puts next_dir
    link_to("#{title} <span class='sort-icon #{classname}'></span>".html_safe, {column: column, direction: next_dir, search: search}, class: "nav-link nav-link-sort")
  end

  def display_date(post)
    post.updated_at.strftime('%-d %b %Y  %H:%M')
  end

  private

  def img_column(post)
    content_tag(:div, class: "col-sm-4") do
      image_tag(post.image, class: "rounded img-fluid")
    end
  end

  def post_column(post)
    content_tag(:div, class: "col-sm-8 mt-6") do
      [
        content_tag(:div, class: "row") do
          content_tag(:p) do
            post.text
          end
        end,
        content_tag(:div, class: "row") do
          display_rating(post)
        end
      ].join.html_safe
    end
  end
end
