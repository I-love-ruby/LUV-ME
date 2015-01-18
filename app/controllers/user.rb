
#update(edit) a user profile
get '/user/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'user/edit'
end

put '/user/:id' do |id|
  @user = User.find(id)
  @user.update(params[:user])
  erb :home
end


get '/user/:id/delete' do |id|
  @user = User.find(id)
  erb :delete
end

delete '/user/:id/delete' do |id|
  User.find(id).destroy
  redirect('/')
end


# Dashboard

get '/user/:id/home' do |id|
  @user = User.find(id)
  erb :home
end

# Survey routes
get '/user/:id/survey' do |id|
  @user = User.find(id)
  @survey = Survey.find(1)
  @questions = @survey.questions
  erb :'/user/survey'
end

post '/user/:id/survey' do |id|
  @user = User.find(id)
  @user.selections.destroy
  params[:answer].each do |k, v|
    @user.selections.find_or_create_by(answer_id: v)
  end
  erb :home
end


get '/user/:id' do
  @user = User.find_by(id: params[:id])
  erb :'user/user_profile'
end