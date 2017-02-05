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
      battles: Battle.all
    }
  end

  def streams
    render locals: {
      streams: Stream.all
    }
  end
end
