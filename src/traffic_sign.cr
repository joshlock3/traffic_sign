require "kemal"
require "./database/*"

module TrafficSign
  get "/" do
    render "src/views/index.ecr", "src/views/layouts/application.ecr"
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

Kemal.run
