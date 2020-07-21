require "application_system_test_case"

class EstimatesTest < ApplicationSystemTestCase
  setup do
    @estimate = estimates(:one)
  end

  test "visiting the index" do
    visit estimates_url
    assert_selector "h1", text: "Estimates"
  end

  test "creating a Estimate" do
    visit estimates_url
    click_on "New Estimate"

    fill_in "Address", with: @estimate.address
    fill_in "Price", with: @estimate.price
    fill_in "Site", with: @estimate.site
    click_on "Create Estimate"

    assert_text "Estimate was successfully created"
    click_on "Back"
  end

  test "updating a Estimate" do
    visit estimates_url
    click_on "Edit", match: :first

    fill_in "Address", with: @estimate.address
    fill_in "Price", with: @estimate.price
    fill_in "Site", with: @estimate.site
    click_on "Update Estimate"

    assert_text "Estimate was successfully updated"
    click_on "Back"
  end

  test "destroying a Estimate" do
    visit estimates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estimate was successfully destroyed"
  end
end
