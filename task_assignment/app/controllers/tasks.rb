TaskAssignment::App.controllers :tasks do
  
  
  get :index do
    @tasks = Task.all
    render '/tasks/index'
  end

  post :index do
    @tasks = Task.new(:title => params[:title])
    @tasks.save
    redirect "/tasks/show/#{@tasks.id}"
  end

  put :index, :with => :id  do
  @tasks = Task.find(params[:id])
  @tasks.title = params[:title]
  @tasks.save
  redirect "/tasks/show/#{@tasks.id}"
  end

  delete :index, :with => :id do
  Task.find(params[:id]).destroy
  redirect '/tasks'
  end

  get :show, :with => :id do
    @tasks = Task.find(params[:id])
    render '/tasks/show'
  end

  get :edit, :with => :id do
  @tasks = Task.find(params[:id])
  render '/tasks/edit'
  end

  get :new do
    render '/tasks/new'
  end

end
