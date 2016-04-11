require "kemal"
require "kilt/slang"
require "./database/*"

module TrafficSign
  get "/" do
    render "src/views/index.ecr", "src/views/layouts/application.ecr"
  end

  post "/project/create" do |params|
  end

  patch "/project/update" do |params|
  end

  delete "/project/destroy" do |params|
  end
end

Kemal.run
