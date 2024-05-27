require "test_helper"
class WatchesControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:not_admin)
    @watch = watches(:one)
  end

  test "should get index for all users" do
    get watches_url
    assert_response :success
    sign_out users(:not_admin)
    get watches_url
    assert_response :success
  end

  test "should get new for admin" do
    sign_out users(:not_admin)
    sign_in users(:admin)
    get new_watch_url
    assert_response :success
  end

  test "shouldn't get new if user signed out" do
    # sign_out users(:not_admin)
    get new_watch_url
    assert_response :missing
  end

  test "should create watch" do
    sign_in users(:admin)
    assert_difference("Watch.count") do
      post watches_url, params: {
        # watch: { name: "SomeName",
        #          description: "sometext123123",
        #          price: "211",
        #          view_url: "someURL123123" } }
        watch: { category_id: @watch.category_id,
                 description: @watch.description,
                 name: @watch.name,
                 price: @watch.price,
                 view_url: @watch.view_url } }
    end

    assert_redirected_to watch_url(Watch.last)
  end

  test "should show watch" do
    get watch_url(@watch)
    assert_response :success
  end

  test "should get edit" do
    sign_out users(:not_admin)
    sign_in users(:admin)
    get edit_watch_url(@watch)
    assert_response :success
  end

  test "shouldn't update watch if user signed out or not admin" do
    patch watch_url(@watch),
          params: { watch: { category_id: @watch.category_id, description: @watch.description,
                             name: "name1", price: @watch.price, view_url: @watch.view_url } }
    assert_response :missing
    sign_out users(:not_admin)
    patch watch_url(@watch),
          params: { watch: { category_id: @watch.category_id, description: @watch.description,
                             name: "name1", price: @watch.price, view_url: @watch.view_url } }
    assert_response :missing

  end
  test "should update watch" do
    sign_out users(:not_admin)
    sign_in users(:admin)
    patch watch_url(@watch),
          params: { watch: { category_id: @watch.category_id, description: @watch.description,
                             name: "name1", price: @watch.price, view_url: @watch.view_url } }
    assert_redirected_to watch_url(@watch)
  end

  test "should destroy watch" do
    sign_out users(:not_admin)
    sign_in users(:admin)
    assert_difference("Watch.count", -1) do
      post watch_url(@watch)
    end
    assert_redirected_to watches_url
  end

  test "shouldn't destroy watch if user signed out or not admin" do
    assert_difference("Watch.count", 0) do
      delete watch_url(@watch)
    end
    assert_response :missing
    sign_out users(:not_admin)
    assert_difference("Watch.count", 0) do
      delete watch_url(@watch)
    end
    assert_response :missing
  end
end
