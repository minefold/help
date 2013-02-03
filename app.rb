require 'sinatra'
require './lib/article'
require './lib/article_router'
require './lib/category'

get '/' do
  @categories = Dir.glob(File.join(Article::DIR, '*')).map do |path|
    Category.new(path)
  end

  erb :index
end

get ArticleRouter.new do |path|
  erb Article.new(path).body
end
