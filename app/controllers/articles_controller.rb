class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @pagy, @articles = pagy(Article.order(id: :desc), items: 25)
    if params[:name].present?
      @articles = Article.where('title LIKE ?', "%#{params[:title]}%")
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Edited.'
      render :edit
    else
      flash.now[:danger] = 'Failed.'
      render :edit
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'Posted!'
      redirect_to @article
    else
      flash.now[:danger] = 'Failed.'
      render :new
    end
  end
  
  def destroy
    @article.destroy
    flash[:success] = 'Deleted.'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :content, :language, :material, :period)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
    end
  end
end
