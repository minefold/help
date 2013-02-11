require 'sinatra'
require 'sinatra/content_for'
require 'active_support/core_ext/string/output_safety'
require './lib/article'
require './lib/article_router'
require './lib/category'

helpers ERB::Util

helpers do

  def title(t)
    @_title = t
  end

end

get '/' do
  @categories = Category.all_from_dir(Article::DIR)
  erb :index
end

get ArticleRouter.new do |path|
  @article = Article.new(path)
  @related_articles = @article.category.articles.reject{|a| a.slug == @article.slug}

  erb :article
end
