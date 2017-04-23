class Api::BattleWorksController < ApplicationController
  before_filter :check_current_user

  def create
    binding.pry
    battle = Battle.find(params[:battle_id])
    if battle
      battle_work = current_user.battle_works.new(battle_work_params, battle: battle)
      if battle_work.save
        head :created
      else
        head :internal_server_error
      end
    else
      head :unproccessable_entity
    end
  end

  def battle_work_params
    params.require(:battle_work).permit(:description, :software)
  end
end
