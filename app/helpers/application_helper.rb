module ApplicationHelper

  def markdown(content)
    options = {
      :autolink => true,
      :fenced_codeblocks => true,
      :no_intra_emphasis => true,
      :space_after_headers => true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(content).html_safe
  end

  def full_title(page_title = '')
    if page_title.empty?
      "Cody Ma"
    else
      page_title
    end
  end

end
