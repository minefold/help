require './lib/article'

class Category

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def slug
    File.basename(path)
  end

  def articles
    Dir.glob(File.join(path, '*.md')).map do |path|
      Article.new(path)
    end
  end

end
