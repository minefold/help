require 'active_support/core_ext/string/inflections'
require './lib/article'

class Category

  attr_reader :path

  def self.all_from_dir(dir)
    Dir.glob(File.join(dir, '*')).map {|path| self.new(path) }
  end

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

  def name
    slug.titleize
  end

  def parent_dir
    File.dirname(path)
  end

  def parent
    self.class.new(parent_dir)
  end

  def siblings
    self.class.all_from_dir(parent_dir)
  end

end
