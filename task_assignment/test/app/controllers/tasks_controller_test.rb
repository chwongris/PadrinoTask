require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class TasksControllerTest < Test::Unit::TestCase
  context "TasksController" do
    setup do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      @task = Task.new(:title => "Laundry")
      @task.save
      # binding.pry
    end

    should "return all Tasks when we visit /tasks" do
      get '/tasks'
      assert last_response.ok?
      assert last_response.body.include? ("Laundry")
    end

    should "return first Task when we visit /tasks/show/1" do
      get '/tasks/show/1'
      assert last_response.ok?
      assert last_response.body.include? ("Laundry")
    end

    should "show me a form to create a task when we visit /tasks/new" do
      get '/tasks/new'
      assert last_response.ok?
      assert last_response.body.include?("Create new task")
    end

    should "show me the new task and save it to the database" do
      post '/tasks', {:title => "Light Bulbs"}
      follow_redirect!
      assert_equal "/tasks/show/2", last_request.path
      assert_equal 2, Task.count
    end

    should "show me a form to edit a task when we visit /tasks/edit/1" do
      get '/tasks/edit/1'
      assert last_response.ok?
      assert last_response.body.include?("Edit Laundry")
    end

    should "update the existing record to be called Send Out Laundry" do
      put '/tasks/1'
      follow_redirect!
      assert_equal "/tasks/show/1", last_request.path
      assert_equal 1, Task.count
    end

    should "delete the existing record" do
      delete '/tasks/1'
      follow_redirect!
      assert_equal "/tasks", last_request.path
      assert_equal 0, Task.count
    end


    teardown do
        DatabaseCleaner.clean
    end


  end
end
