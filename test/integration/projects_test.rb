require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  test "can see projects" do
    login( {:login => "user2", :password => "password"})
    get '/'
    assert_response :success 
  end

  test "can see first project" do
    login( {:login => "user2", :password => "password"})
    get '/projects/1'
    assert_response :success 
  end

  test "can see create a project" do
    login( {:login => "user2", :password => "password"})
    post '/projects/', {:name => "test123", :details => "TEST"} 
    #pp response
    assert_response :redirect
  end




end
