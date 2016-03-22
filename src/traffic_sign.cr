require "kemal"
require "./database/*"

get "/" do
  render "src/views/index.ecr"
end

get "/project/show" do
  render "src/views/index.ecr"
end

get "/project/new" do
  render "src/views/index.ecr"
end

get "/project/create" do
end

get "/project/edit" do
  render "src/views/index.ecr"
end

get "/project/update" do

end

get "/project/destroy" do

end

Kemal.run
