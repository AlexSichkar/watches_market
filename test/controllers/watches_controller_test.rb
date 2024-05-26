require "test_helper"

class WatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watch = watches(:one)
  end

  test "should get index" do
    get watches_url
    assert_response :success
  end

  test "should get new for logged users" do
    sign_in users(:not_admin)
    get new_watch_url
    assert_response :success
  end

  test "shouldn't get new if user signed out" do
    sign_out users(not:admin)
    get new_watch_url
    assert_response :missing
  end

  test "should create watch" do
    sign_in users(:admin)
    assert_difference("Watch.count") do
      post watches_url, params: {
        watch: { description: "sometext123123",
                 name: "SomeName",
                 price: "211",
                 view_url: "someURL123123" } }
      # { category_id: @watch.category_id,
      #   description: @watch.description,
      #   name: @watch.name,
      #   price: @watch.price,
      #   user_id: @watch.user_id,
      #   view_url: @watch.view_url }

    #   { description: "sometext123123",
      #                  name: "SomeName",
      #                  price: "211",
      #                  view_url: "someURL123" }
    end

    assert_redirected_to watch_url(Watch.last)
  end

  test "should show watch" do
    get watch_url(@watch)
    assert_response :success
  end

  test "should get edit" do
    get edit_watch_url(@watch)
    assert_response :success
  end

  test "should update watch" do
    patch watch_url(@watch),
          params: { watch: { category_id: @watch.category_id, description: @watch.description, name: @watch.name, price: @watch.price, user_id: @watch.user_id, view_url: @watch.view_url } }
    assert_redirected_to watch_url(@watch)
  end

  test "should destroy watch" do
    assert_difference("Watch.count", -1) do
      delete watch_url(@watch)
    end

    assert_redirected_to watches_url
  end
end
