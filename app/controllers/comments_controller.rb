class CommentsController < ApplicationController
  def create
    # Where does article_id param come from????
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
  
    @comment.save
  
    redirect_to article_path(@comment.article)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
