class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :destroy, :new, :create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author = current_user.username
    @comment.save
    redirect_to article_path(@article)
  end

  def index
    @comments = @article.comments.all
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])


  end

  def update
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to article_path(@article)
      else
        render action: 'edit'
      end
  end

  def destroy
     @article = Article.find(params[:article_id])
     @comment = Comment.find(params[:id])
     @comment.destroy

     redirect_to article_path(@article)
  end



  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end

