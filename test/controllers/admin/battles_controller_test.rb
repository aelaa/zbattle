require 'test_helper'

class Admin::BattlesControllerTest < ActionController::TestCase
  setup do
    @admin_battle = admin_battles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_battles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_battle" do
    assert_difference('Admin::Battle.count') do
      post :create, admin_battle: { deadline: @admin_battle.deadline, description: @admin_battle.description, name: @admin_battle.name }
    end

    assert_redirected_to admin_battle_path(assigns(:admin_battle))
  end

  test "should show admin_battle" do
    get :show, id: @admin_battle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_battle
    assert_response :success
  end

  test "should update admin_battle" do
    patch :update, id: @admin_battle, admin_battle: { deadline: @admin_battle.deadline, description: @admin_battle.description, name: @admin_battle.name }
    assert_redirected_to admin_battle_path(assigns(:admin_battle))
  end

  test "should destroy admin_battle" do
    assert_difference('Admin::Battle.count', -1) do
      delete :destroy, id: @admin_battle
    end

    assert_redirected_to admin_battles_path
  end
end
