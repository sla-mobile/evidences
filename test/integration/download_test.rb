require 'test_helper'

class DownloadTest < ActionDispatch::IntegrationTest
  fixtures :all
  test "can download test.txt" do
     get '/download/?filename=test.txt'
     assert_response :success
   end
end
