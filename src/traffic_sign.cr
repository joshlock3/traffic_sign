require "kemal"
# require "kemal-pg"

get "/" do
  render "src/views/index.ecr"
end


Kemal.run
