module PathHelper 
  def current_uri
    request.env['PATH_INFO']
  end
end
