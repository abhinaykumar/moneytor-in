require 'test_helper'

class MutualFundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mutual_fund = mutual_funds(:one)
  end

  test "should get index" do
    get mutual_funds_url
    assert_response :success
  end

  test "should get new" do
    get new_mutual_fund_url
    assert_response :success
  end

  test "should create mutual_fund" do
    assert_difference('MutualFund.count') do
      post mutual_funds_url, params: { mutual_fund: { date_of_invetment: @mutual_fund.date_of_invetment, invetment_amount: @mutual_fund.invetment_amount, invetment_type: @mutual_fund.invetment_type, name: @mutual_fund.name, portfolio_id: @mutual_fund.portfolio_id, units: @mutual_fund.units } }
    end

    assert_redirected_to mutual_fund_url(MutualFund.last)
  end

  test "should show mutual_fund" do
    get mutual_fund_url(@mutual_fund)
    assert_response :success
  end

  test "should get edit" do
    get edit_mutual_fund_url(@mutual_fund)
    assert_response :success
  end

  test "should update mutual_fund" do
    patch mutual_fund_url(@mutual_fund), params: { mutual_fund: { date_of_invetment: @mutual_fund.date_of_invetment, invetment_amount: @mutual_fund.invetment_amount, invetment_type: @mutual_fund.invetment_type, name: @mutual_fund.name, portfolio_id: @mutual_fund.portfolio_id, units: @mutual_fund.units } }
    assert_redirected_to mutual_fund_url(@mutual_fund)
  end

  test "should destroy mutual_fund" do
    assert_difference('MutualFund.count', -1) do
      delete mutual_fund_url(@mutual_fund)
    end

    assert_redirected_to mutual_funds_url
  end
end
