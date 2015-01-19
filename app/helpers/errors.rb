def set_error(err_msg)
  session[:error] = err_msg
end

def display_error
  error = session[:error]
  session[:error] = nil
  error
end