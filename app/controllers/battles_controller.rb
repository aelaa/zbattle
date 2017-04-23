class BattlesController < ApplicationController
  def index
    render locals: {
      battles: Battle.all
    }
  end

  def show
    battle = Battle.find(params[:id])
    render locals: {
      battle: battle,
      work: current_user.battle_works.new(battle: battle)
    }
  end
end
