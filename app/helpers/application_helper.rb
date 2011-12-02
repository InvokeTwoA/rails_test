module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :fenced_code, :gh_blockcode]
    #Redcarpet.new(text, *options)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
  end
                          
  def to_youtube(html)
    
  end
end
