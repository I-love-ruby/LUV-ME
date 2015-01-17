post '/login' do
  user = User.find_by(name: params[:user][:email])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
  end
  redirect "/"
end

post '/signup' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
  end
  redirect "/"
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end

#update(edit) a user profile
get '/user/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'user/edit'
end

put '/user/:id' do |id|
  user = User.find(id)
  user.update(params[:user])
  redirect("/user/#{user.id}/home")
end

delete '/user/:id' do |id|
  User.find(id).destroy
  redirect('/')
end


# Dashboard

get '/user/:id/home'
  erb :home
end

# Survey routes
get '/user/:id/survey/new' do
  erb :'/user/survey'
end

post '/user/:id/survey/new' do |id|
  @user = User.find(id)
  Survey.create(params[:survey])
end
