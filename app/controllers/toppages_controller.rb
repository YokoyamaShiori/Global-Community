class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build
      @pagy, @posts = pagy(current_user.feed_posts.order(id: :desc))
    end
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @pagy, @posts = pagy(current_user.feed_posts.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
end
