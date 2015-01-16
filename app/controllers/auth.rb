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
