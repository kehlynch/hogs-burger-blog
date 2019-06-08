module WelcomeHelper
  def display_rating(post)
    post.rating.times.collect do
      content_tag(:span, class: "col-1 pr-0 pl-0") do
        burger()
      end
    end.join.html_safe
  end

  def burger
    image_tag("burger.png", class: "img-fluid")
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
