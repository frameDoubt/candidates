# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here
# puts "Experienced? function returns a boolean:"
# pp github_100_point_club?(@candidates[4])
# pp github_100_point_club?(@candidates[1])

# puts "Find function result:"
# pp find(7)
# pp find(8)
puts "These are the qualified candidates"
pp qualified_candidates(@candidates)
puts "These are the candidates ordered by years of experience, the github points"
pp ordered_by_qualifications(@candidates)
put "This is the candidates list"
pp @candidates