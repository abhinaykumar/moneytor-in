require "application_system_test_case"

class SavingAccountsTest < ApplicationSystemTestCase
  setup do
    @saving_account = saving_accounts(:one)
  end

  test "visiting the index" do
    visit saving_accounts_url
    assert_selector "h1", text: "Saving Accounts"
  end

  test "creating a Saving account" do
    visit saving_accounts_url
    click_on "New Saving Account"

    fill_in "Amount saved", with: @saving_account.amount_saved
    fill_in "Listed bank", with: @saving_account.listed_bank_id
    fill_in "Rate of interest", with: @saving_account.rate_of_interest
    click_on "Create Saving account"

    assert_text "Saving account was successfully created"
    click_on "Back"
  end

  test "updating a Saving account" do
    visit saving_accounts_url
    click_on "Edit", match: :first

    fill_in "Amount saved", with: @saving_account.amount_saved
    fill_in "Listed bank", with: @saving_account.listed_bank_id
    fill_in "Rate of interest", with: @saving_account.rate_of_interest
    click_on "Update Saving account"

    assert_text "Saving account was successfully updated"
    click_on "Back"
  end

  test "destroying a Saving account" do
    visit saving_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saving account was successfully destroyed"
  end
end
