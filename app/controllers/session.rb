get '/session/new' do
  erb :login
end

post '/session/create' do
  username = params[:username]
  user = User.authenticate(username, params[:password])

  if user
    session[:user_id] = user.id
    redirect to '/'
  else
    @error = "invalid email or password"
    erb :login
  end
end

get '/session/delete' do
  clear_user
  redirect to '/'
end