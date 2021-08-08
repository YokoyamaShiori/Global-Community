class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Posted comment.'
      redirect_back(fallback_location: root_path) 
    else
      redirect_back(fallback_location: root_path) 
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id) 
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
