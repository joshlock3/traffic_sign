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
    render "src/views/new.html.ecr", "src/views/layouts/application.ecr"
  end

  post "/project/create" do
  end

  get "/project/edit" do
    render "src/views/edit.slang", "src/views/layouts/application.ecr"
  end

  get "/project/click_counter" do
    render "src/views/click_counter.html.ecr"
  end

  patch "/project/update" do
  end

  delete "/project/destroy" do
  end
end

Kemal.run
