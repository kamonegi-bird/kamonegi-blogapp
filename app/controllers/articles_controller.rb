class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "\u4FDD\u5B58\u3067\u304D\u305F\u3088"
    else
      flash.now[:error] = "\u4FDD\u5B58\u306B\u5931\u6557\u3057\u307E\u3057\u305F"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "\u4FDD\u5B58\u3067\u304D\u307E\u3057\u305F"
    else
      flash.now[:error] = "\u66F4\u65B0\u3067\u304D\u307E\u305B\u3093\u3067\u3057\u305F"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path, status: :see_other, notice: "\u524A\u9664\u306B\u6210\u529F\u3057\u307E\u3057\u305F"
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
