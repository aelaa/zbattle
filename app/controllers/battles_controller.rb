class BattlesController < ApplicationController
  def index
    render locals: {
      battles: Battle.all
    }
  end

  def show
    render locals: { battle: Battle.find(params[:id]) }
  end
end
