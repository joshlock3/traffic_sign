require "kemal"
require "./database/*"

module TrafficSign
  get "/" do |env|
    render "src/views/index.ecr", "src/views/layouts/application.ecr"
  end

  get "/project/show" do
    render "src/views/index.ecr", "src/views/layouts/application.ecr"
  end

  get "/project/new" do
    render "src/views/new.ecr", "src/views/layouts/application.ecr"
  end

  post "/project/create" do
  end

  get "/project/edit" do
    render "src/views/edit.ecr", "src/views/layouts/application.ecr"
  end

  patch "/project/update" do
  end

  delete "/project/destroy" do
  end
end

Kemal.run
