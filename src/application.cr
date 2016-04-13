require "kemal"
require "./database/**"
require "./configuration/*"

# p "this is the current set of projects: #{Project.all.to_hash}"
# p "this is the current set of teams: #{Team.all.to_hash}"
# p "this is the current set of status: #{Status.all.to_hash}"

Kemal.run
