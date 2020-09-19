require 'test_helper'

class SavingAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saving_account = saving_accounts(:one)
  end

  test "should get index" do
    get saving_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_saving_account_url
    assert_response :success
  end

  test "should create saving_account" do
    assert_difference('SavingAccount.count') do
      post saving_accounts_url, params: { saving_account: { amount_saved: @saving_account.amount_saved, listed_bank_id: @saving_account.listed_bank_id, rate_of_interest: @saving_account.rate_of_interest } }
    end

    assert_redirected_to saving_account_url(SavingAccount.last)
  end

  test "should show saving_account" do
    get saving_account_url(@saving_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_saving_account_url(@saving_account)
    assert_response :success
  end

  test "should update saving_account" do
    patch saving_account_url(@saving_account), params: { saving_account: { amount_saved: @saving_account.amount_saved, listed_bank_id: @saving_account.listed_bank_id, rate_of_interest: @saving_account.rate_of_interest } }
    assert_redirected_to saving_account_url(@saving_account)
  end

  test "should destroy saving_account" do
    assert_difference('SavingAccount.count', -1) do
      delete saving_account_url(@saving_account)
    end

    assert_redirected_to saving_accounts_url
  end
end
