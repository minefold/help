require './lib/article'
require './lib/route'

class ArticleRouter

  # Match = Struct.new(:captures)

  def match(str)
    path = File.join(Article::DIR, "#{str}.md")
    if File.exists?(path)
      Route.new(path)
    end
  end

end
