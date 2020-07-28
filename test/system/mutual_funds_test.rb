require "application_system_test_case"

class MutualFundsTest < ApplicationSystemTestCase
  setup do
    @mutual_fund = mutual_funds(:one)
  end

  test "visiting the index" do
    visit mutual_funds_url
    assert_selector "h1", text: "Mutual Funds"
  end

  test "creating a Mutual fund" do
    visit mutual_funds_url
    click_on "New Mutual Fund"

    fill_in "Date of invetment", with: @mutual_fund.date_of_invetment
    fill_in "Invetment amount", with: @mutual_fund.invetment_amount
    fill_in "Invetment type", with: @mutual_fund.invetment_type
    fill_in "Name", with: @mutual_fund.name
    fill_in "Portfolio", with: @mutual_fund.portfolio_id
    fill_in "Units", with: @mutual_fund.units
    click_on "Create Mutual fund"

    assert_text "Mutual fund was successfully created"
    click_on "Back"
  end

  test "updating a Mutual fund" do
    visit mutual_funds_url
    click_on "Edit", match: :first

    fill_in "Date of invetment", with: @mutual_fund.date_of_invetment
    fill_in "Invetment amount", with: @mutual_fund.invetment_amount
    fill_in "Invetment type", with: @mutual_fund.invetment_type
    fill_in "Name", with: @mutual_fund.name
    fill_in "Portfolio", with: @mutual_fund.portfolio_id
    fill_in "Units", with: @mutual_fund.units
    click_on "Update Mutual fund"

    assert_text "Mutual fund was successfully updated"
    click_on "Back"
  end

  test "destroying a Mutual fund" do
    visit mutual_funds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mutual fund was successfully destroyed"
  end
end
