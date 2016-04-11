module Routes
  ######   ROOT/SINGLE PAGE   ######

  get "/" do
    render "src/views/index.ecr", "src/views/layouts/application.ecr"
  end

  ######   PROJECTS   ######

  post "/project/create" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end

  patch "/project/update" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end

  delete "/project/destroy" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end

  ######   TEAMS   ######

  post "/team/create" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end

  patch "/team/update" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end

  delete "/team/destroy" do |env|
    params = env.params
    # perform some action with the params and redirect back to root
    env.redirect "/"
  end
end
