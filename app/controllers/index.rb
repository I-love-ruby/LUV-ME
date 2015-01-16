get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/:id' do
  @user = User.find_by(id: params[:id])
  erb :'user/user_profile'
end


#update(edit) a user profile
get '/user/:id/edit' do
  @user = User.find(params[:id])
  erb :'user/edit'
end

put '/user/:id' do |id|
  user = User.find(id)
  user.update(params[:user])
  redirect("/user/#{user.id}")
end

