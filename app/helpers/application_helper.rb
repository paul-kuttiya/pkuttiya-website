module ApplicationHelper
  def link_to_active?(link, url, html_options={})
    active = "active" if current_page?(url)
    content_tag :li, class: active do
      link_to link, url, html_options
    end
  end

  def join_newline(input)
    input.join("\n")
  end
end
