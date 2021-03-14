# frozen_string_literal: true

# require 'gruff'
require 'csv'
require 'json'

############################# problem 1 ############################

# def team(filename)
#   file = CSV.parse(File.read(filename), headers: true)
#   teams = Hash.new(0)
#   file.each do |i|
#     teams[i['batting_team']] += i['total_runs'].to_i
#   end
#   teams.delete('Rising Pune Supergiants')
#   [teams]
#   open('practice.json', 'w') { |f| f.write teams.to_json }
# end
# teams = team('deliveries.csv')

# # #################### problem 2 ############################
def rcb(filename)
  file = CSV.parse(File.read(filename), headers: true)
  teams = Hash.new(0)
  file.each do |i|
    teams[i['batsman']] += i['total_runs'].to_i if i['batting_team'] == 'Royal Challengers Bangalore'
  end
  team = Hash[teams.uniq.sort_by { |_k, v| -v }[0..5]]
  [team]
  open('prob2.json', 'w') { |f| f.write team.to_json }
end
teams = rcb('deliveries.csv')

# # #################### problem 3 ############################1
# def umpire_n(filename)
#   file = CSV.parse(File.read(filename), headers: true)
#   umpires = Hash.new(0)
#   file.each do |i|
#     umpires[i['Nationality']] += 1.to_i
#   end
#   umpires.delete('  India')
#   [umpires]
#   open('prob3.json', 'w') { |f| f.write umpires.to_json }
# end
# umpires = umpire_n('umpires.csv')

# ########################### problem 4 #########################
# def totseason(filename)
#   file = CSV.parse(File.read(filename), headers: true)
#   sname = []
#   file.each do |i|
#     sname.append(i['team1']) unless sname.include? i['team1']
#   end
#   teams = {}
#   year = Array[]
#   file.each do |i|
#     teams[i['team1']] = i['team1'], Array[] unless teams.include? i['team1']
#     teams[i['team2']] = i['team2'], Array[] unless teams.include? i['team2']
#     year.append(i['date'][0..3])
#   end
#   year = year.uniq.sort
#   teams.each do |key, _value|
#     teams[key] = Array.new(year.length, 0)
#   end

#   file.each do |i|
#     ind = year.index(i['date'][0..3])
#     teams[i['team1']][ind] += 1
#     teams[i['team2']][ind] += 1
#   end
#   [teams, year, sname]
#   open('prob4.json', 'w') { |f| f.write teams.to_json }
# end
# teams, year, sname = totseason('matches.csv')
