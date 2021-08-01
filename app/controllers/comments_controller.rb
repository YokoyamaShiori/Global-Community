class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @post_id = params[:post_id]
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Posted comment.'
      redirect_back(fallback_location: root_path) 
    else
      redirect_back(fallback_location: root_path) 
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = 'Deleted comment'
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.permit(:comment_content, :post_id) 
  end
end
