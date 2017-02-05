class Admin::NewsArticlesController < Admin::ApplicationController
  def index
    render locals: { news: NewsArticle.all }
  end

  def show
    render locals: { news: current_news }
  end

  def new
    render locals: { news: NewsArticle.new }
  end

  def edit
    render locals: { news: current_news }
  end

  def create
    news = NewsArticle.new(news_params)

    if news.save
      redirect_to [:admin, news], notice: 'Article was successfully created.'
    else
      render :new, locals: { news: news }
    end
  end

  def update
    if current_news.update(news_params)
      redirect_to [:admin, current_news], notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    current_news.destroy
    redirect_to admin_news_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    def current_news
      @news ||= NewsArticle.find(params[:id])
    end

    def news_params
      params.require(:news_article).permit(:name, :article)
    end
end
