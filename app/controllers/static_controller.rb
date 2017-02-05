class StaticController < ApplicationController
  def main
  end

  def news
    render locals: {
      news: NewsArticle.all
    }
  end

  def battles
    render locals: {
      news: Battle.all
    }
  end

  def streams
    render locals: {
      news: Stream.all
    }
  end
end
