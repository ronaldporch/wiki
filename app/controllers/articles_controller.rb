class ArticlesController < ApplicationController
before_filter :authenticate_user!, only: [:edit, :new, :create, :update]
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      @article.users << current_user
      redirect_to article_path(@article), notice: "Article Successfully Created"
    else
      redirect_to new_article_path, notice: "Come On Guy, don't be stupid."
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @article.users << current_user
      redirect_to article_path(@article), notice: "Article Successfully Updated"
    else
      redirect_to edit_article_path(@article), notice: "Come On Guy, don't be stupid."
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully destroyed.'
  end

  private
  def article_params
    params.require(:article).permit(:name, :content)
  end
end
