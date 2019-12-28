class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    
  end
  
  def show
     @article = Article.find(params[:id])
  end
  
  def create
    Article.create(nickname: params[:nickname] , text: params[:text] , user_id: current_user.id)
    @article = params[:text]
  end
  
  def edit
    @article = Article.find(params[:id])
    unless (@article.user_id.to_i == current_user.id)
      redirect_to action: :index 
    end
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(nickname: params[:nickname] , text: params[:text])
    @article = params[:text]
  end
  
  def destroy
    @article = Article.find(params[:id])
    unless (@article.user_id.to_i == current_user.id)
      redirect_to action: :index 
    else    
      @article.destroy
    end
  end
end
