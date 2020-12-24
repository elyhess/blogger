class CommentsController < ApplicationController
  def create
    # Q: Where does article_id param come from????

    # A: Forms with models will default to using the restful routes. 
    # When you have two models, it creates nested routes, 
    # in this case /articles/:article_id/comments . 
    # So the param is actually being passed through a dynamic segment in the route
    
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
