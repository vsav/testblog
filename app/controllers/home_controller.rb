class HomeController < ApplicationController
  def new

  end

  def create
    render plain: params[:contact].inspect
  end

  def index
    @articles = Article.all
  end

end
