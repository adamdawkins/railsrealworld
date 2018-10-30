module ArticlesHelper
  def md_to_html(md)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(md)
  end
end
