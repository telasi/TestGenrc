require 'test_helper'

class PlannedOutagesControllerTest < ActionController::TestCase
  setup do
    @planned_outage = planned_outages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_outages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_outage" do
    assert_difference('PlannedOutage.count') do
      post :create, planned_outage: { abonent_amount: @planned_outage.abonent_amount, break_reason: @planned_outage.break_reason, compare_date_2: @planned_outage.compare_date_2, disabling_area: @planned_outage.disabling_area, info_url: @planned_outage.info_url, jit_infromation_consumer_count: @planned_outage.jit_infromation_consumer_count, list_of_media: @planned_outage.list_of_media, log_day: @planned_outage.log_day, record_status: @planned_outage.record_status, response_id: @planned_outage.response_id, self_governed_district_abonents_count: @planned_outage.self_governed_district_abonents_count, self_governed_district_name: @planned_outage.self_governed_district_name, sms: @planned_outage.sms }
    end

    assert_redirected_to planned_outage_path(assigns(:planned_outage))
  end

  test "should show planned_outage" do
    get :show, id: @planned_outage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planned_outage
    assert_response :success
  end

  test "should update planned_outage" do
    patch :update, id: @planned_outage, planned_outage: { abonent_amount: @planned_outage.abonent_amount, break_reason: @planned_outage.break_reason, compare_date_2: @planned_outage.compare_date_2, disabling_area: @planned_outage.disabling_area, info_url: @planned_outage.info_url, jit_infromation_consumer_count: @planned_outage.jit_infromation_consumer_count, list_of_media: @planned_outage.list_of_media, log_day: @planned_outage.log_day, record_status: @planned_outage.record_status, response_id: @planned_outage.response_id, self_governed_district_abonents_count: @planned_outage.self_governed_district_abonents_count, self_governed_district_name: @planned_outage.self_governed_district_name, sms: @planned_outage.sms }
    assert_redirected_to planned_outage_path(assigns(:planned_outage))
  end

  test "should destroy planned_outage" do
    assert_difference('PlannedOutage.count', -1) do
      delete :destroy, id: @planned_outage
    end

    assert_redirected_to planned_outages_path
  end
end
