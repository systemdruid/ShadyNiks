class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  layout "admin"

  def index
  end

  def all
    articles = Article.all
    render :json => articles
  end

  def create
    request_data = JSON.parse(request.body.read)
    article = Article.new(request_data["data"]) 
    response = article.save
    render :json => article
  end

  def update
    request_data = JSON.parse(request.body.read)
    response = Article.update(request_data["data"])
    render :json => response.first
  end

  def destroy
    response = Article.delete(params["id"]);
    render :json => response
  end
end
