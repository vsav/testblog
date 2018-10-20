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
    if @comment.author == current_user.username
      render action: 'edit'
    else
      @message = 'You do not have permission to do that'
      redirect_to article_path(@article), alert: @message
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    if @comment.author == current_user.username
      render action: 'edit'
    else
      @message = 'You do not have permission to do that'
      redirect_to article_path(@article), alert: @message
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        @message = 'Comment updated'
        redirect_to article_path(@article), notice: @message
      else
        render action: 'edit'
      end
  end

  def destroy
     @article = Article.find(params[:article_id])
     @comment = Comment.find(params[:id])
     if @comment.author == current_user.username
       @comment.destroy
       @message = 'Comment deleted'
       @comment.destroy
       redirect_to article_path(@article), notice: @message
     else
       @message = 'You do not have permission to do that'
       redirect_to article_path(@article), alert: @message
     end
  end



  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end

