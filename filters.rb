# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Takes an id
  if @candidates.include?([:id])
    return @candidates.select { |a| a[:id] == id }
  # Returns the candidate with that :id
  else
  # returns false otherwise
    return nil
  end
end

def experienced?(candidate)
  # Your code Here
  if candidate[:years_of_experience] >= 2
    return true
  else 
    return false
  end
end

def qualified_candidates(candidates)
  # take in collection of candidates
  # returns a subset of the candidates that meet the following criteria
  # Are experienced
  experienced_candidates = candidates.select { |candidate| experienced?(candidate) }
  # Have 100 or more Github points
  github_point_club = experienced_candidates.select { |candidate| github_100_point_club?(candidate) }
  # Know at least Ruby or Python
  knows_python_or_ruby = github_point_club.select { |candidate| python_or_ruby?(candidate) }
  # Applied in the last 15 days
  applied_in_15_days = knows_python_or_ruby.select { |candidate| in_last_fifteen_days?(candidate) }
  # Are over the age of 17(18+)
  eighteen_plus = applied_in_15_days.select { |candidate| over_age_eighteen?(candidate) }
end

# More methods will go below

# returns candidate with equal and over 100 point on github the game :)
def github_100_point_club?(candidate)
  if candidate[:github_points] >= 100
    return true
  else
    return false
  end
end

def python_or_ruby?(candidate)
  if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
    return true
  else
    return false
  end
end

def in_last_fifteen_days?(candidate)
  if candidate[:date_applied] > 15.days.ago.to_date
    return true
  else
    return false
  end
end

def over_age_eighteen?(candidate)
  if candidate[:age] > 17
    return true
  else
    return false
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate|  [-candidate[:years_of_experience], -candidate[:github_points]] }
end