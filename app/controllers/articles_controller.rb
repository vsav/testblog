class ArticlesController < ApplicationController

  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_user!, only: [:edit, :destroy, :new, :create]

  def new

  end

  def create
    @article = Article.new(article_params)
    @article.title = current_user.username
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def index
    @articles=Article.all
    # @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
  end

  def edit
    @article = Article.find(params[:id])
      if @article.title == current_user.username
        render action: 'edit'
      else
        @message = 'You do not have permission to do that'
        redirect_to :articles, alert: @message
      end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @message = 'Article updated'
      redirect_to @article, notice: @message
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
      if @article.title == current_user.username
        @message = 'Article deleted'
        @article.destroy
        redirect_to articles_path(@article), notice: @message
      else
        @message = 'You do not have permission to do that'
        redirect_to :articles, alert: @message
      end
  end


  private

  def article_params
    params.require(:article).permit(:title, :text)
  end



end
