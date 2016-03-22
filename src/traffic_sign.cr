require "kemal"
require "kilt/slang"
require "./database/*"

module TrafficSign
  get "/" do
    render "src/views/index.slang", "src/views/layouts/application.ecr"
  end

  get "/project/show" do
    render "src/views/index.slang", "src/views/layouts/application.ecr"
  end

  get "/project/new" do
    render "src/views/new.slang", "src/views/layouts/application.ecr"
  end

  post "/project/create" do
  end

  get "/project/edit" do
    render "src/views/edit.slang", "src/views/layouts/application.ecr"
  end

  patch "/project/update" do
  end

  delete "/project/destroy" do
  end
end

Kemal.run
