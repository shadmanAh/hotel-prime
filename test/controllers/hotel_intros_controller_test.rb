require "test_helper"

class HotelIntrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_intro = hotel_intros(:one)
  end

  test "should get index" do
    get hotel_intros_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_intro_url
    assert_response :success
  end

  test "should create hotel_intro" do
    assert_difference('HotelIntro.count') do
      post hotel_intros_url, params: { hotel_intro: { description: @hotel_intro.description, title: @hotel_intro.title } }
    end

    assert_redirected_to hotel_intro_url(HotelIntro.last)
  end

  test "should show hotel_intro" do
    get hotel_intro_url(@hotel_intro)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_intro_url(@hotel_intro)
    assert_response :success
  end

  test "should update hotel_intro" do
    patch hotel_intro_url(@hotel_intro), params: { hotel_intro: { description: @hotel_intro.description, title: @hotel_intro.title } }
    assert_redirected_to hotel_intro_url(@hotel_intro)
  end

  test "should destroy hotel_intro" do
    assert_difference('HotelIntro.count', -1) do
      delete hotel_intro_url(@hotel_intro)
    end

    assert_redirected_to hotel_intros_url
  end
end
