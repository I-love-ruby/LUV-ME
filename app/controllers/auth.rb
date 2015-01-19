post '/login' do
  @user = User.find_by(name: params[:user][:email])

  if @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    erb :home
  end
  set_error('Login Failed, Please Try Again')
  redirect "/"
end

post '/signup' do
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
    redirect "/user/#{user.id}/edit"
  else
    set_error('Signup failed, Please Try Again')
    redirect "/"
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end
