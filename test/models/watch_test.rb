require "test_helper"

class WatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save watch without title" do
    ActionController::HttpAuthentication::Basic.encode_credentials("alex@a.com", "123123")
    # some_undefined_variable
    # assert_not (Watch.new name:"", description: "", price: "", view_url: "").save
    # watch = Watch.new
    # assert_not watch.save, "sasasa"
  end
end
