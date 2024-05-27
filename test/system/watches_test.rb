require "application_system_test_case"

class WatchesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:admin)
    @watch = watches(:one)
  end

  test "visiting the index" do
    visit watches_url
    assert_selector "h1", text: "Watches"
  end

  test "should create watch" do
    visit watches_url
    click_on "Add new"

    fill_in "Category", with: @watch.category_id
    fill_in "Description", with: @watch.description
    fill_in "Name", with: @watch.name
    fill_in "Price", with: @watch.price
    fill_in "User", with: @watch.user_id
    fill_in "View url", with: @watch.view_url
    click_on "Create Watch"

    # assert_text "Watch was successfully created"
    click_on "Back"
  end

  test "should update Watch" do
    visit root_path
    click_on "Edit", match: :first
    fill_in "Name", with: @watch.name
    fill_in "Description", with: @watch.description
    fill_in "Category", with: @watch.category_id
    fill_in "Price", with: @watch.price
    fill_in "View url", with: @watch.view_url
    click_on "Submit"

    # assert_text "Watch was successfully updated"
    click_on "Back"
  end

  test "should destroy Watch" do
    visit root_path
    click_on "Destroy", match: :first

    # assert_text "Watch was successfully destroyed"
  end
end
