# frozen_string_literal: true

# app/controllers/application_controller
class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def new
    @article = Article.new
  end

  def destroy
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to articles_path
  end

  def index
    @articles = Article.paginate(page: params[:page],per_page: 1)
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was updated"
      edirect_to article_path(@article)
    else
      flash[:success] = "Article was not updated"
      ender 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success
        ] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
