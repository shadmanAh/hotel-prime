require "application_system_test_case"

class HotelIntrosTest < ApplicationSystemTestCase
  setup do
    @hotel_intro = hotel_intros(:one)
  end

  test "visiting the index" do
    visit hotel_intros_url
    assert_selector "h1", text: "Hotel Intros"
  end

  test "creating a Hotel intro" do
    visit hotel_intros_url
    click_on "New Hotel Intro"

    fill_in "Description", with: @hotel_intro.description
    fill_in "Title", with: @hotel_intro.title
    click_on "Create Hotel intro"

    assert_text "Hotel intro was successfully created"
    click_on "Back"
  end

  test "updating a Hotel intro" do
    visit hotel_intros_url
    click_on "Edit", match: :first

    fill_in "Description", with: @hotel_intro.description
    fill_in "Title", with: @hotel_intro.title
    click_on "Update Hotel intro"

    assert_text "Hotel intro was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel intro" do
    visit hotel_intros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel intro was successfully destroyed"
  end
end
