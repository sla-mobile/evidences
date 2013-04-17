require 'test_helper'

class IssuesTest < ActionDispatch::IntegrationTest
  test "can see issues" do
    login( {:login => "user2", :password => "password"})
    get '/issues'
    assert_response :success 
  end

  test "can see first project" do
    login( {:login => "user2", :password => "password"})
    get '/issues/1'
    assert_response :success 
  end



end
