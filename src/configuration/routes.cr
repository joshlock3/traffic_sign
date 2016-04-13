module Routes
  ######   ROOT/SINGLE PAGE   ######

  get "/" do
    render "src/views/index.html.ecr", "src/views/layouts/application.html.ecr"
  end

  ######   PROJECTS   ######

  get "/project/all" do |env|
    Project.all.to_hash
  end

  get "/project/team" do |env|
    Project.all.to_hash
  end

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
