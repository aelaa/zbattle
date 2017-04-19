class Admin::BattlesController < Admin::ApplicationController
  def index
    render locals: { battles: Battle.all }
  end

  def show
    render locals: { battle: current_battle }
  end

  def new
    render locals: { battle: Battle.new }
  end

  def edit
    render locals: { battle: current_battle }
  end

  def create
    battle = Battle.new(battle_params)

    if battle.save
      redirect_to [:admin, battle], notice: 'Battle was successfully created.'
    else
      render :new, locals: { battle: battle }
    end
  end

  def update
    if current_battle.update(battle_params)
      redirect_to [:admin, current_battle], notice: 'Battle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    current_battle.destroy
    redirect_to admin_battles_url, notice: 'Battle was successfully destroyed.'
  end

  private
    def current_battle
      @battle ||= Battle.find(params[:id])
    end

    def battle_params
      params.require(:battle).permit(:name, :deadline, :description, image_attributes: [:id, :image])
    end
end
