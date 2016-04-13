module Routes
  ######   ROOT/SINGLE PAGE   ######

  get "/" do
    @initial_projects = Project.all
    @initial_teams = Team.all
    @initial_status = Status.all

    render "src/views/index.html.ecr", "src/views/layouts/application.html.ecr"
  end

  ######   PROJECTS   ######

  get "/project/all" do |env|
    Project.all
  end

  get "/project/team" do |env|
    Project.all
  end

  post "/project/create" do |env|
    params = env.params.json

    Project.create(params)

    env.redirect "/"
  end

  post "/project/update" do |env|
    params = env.params.json
    puts "This is the current params: #{params}"
    Project.update(params["id"],params.reject("id"))
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
