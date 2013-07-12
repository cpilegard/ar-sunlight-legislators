require_relative 'models/legislator'

puts "Senators:"
Legislator.where('state = ? AND title = ?', 'CA', 'Sen').order('lastname').each {|l| puts "  #{l.name}"}

puts "Representatives:"
Legislator.where('state = ? AND title = ?', 'CA', 'Rep').order('lastname').each {|l| puts "  #{l.name}"}
puts
puts

print "Male Senators: "
print Legislator.where('title = ? AND gender = ? AND in_office = ?', 'Sen', 'M', 1).count
print ' (' + (Legislator.where('title = ? AND gender = ? AND in_office = ?', 'Sen', 'M', 1).count.to_f / 
	   Legislator.where('title = ? AND in_office = ?', 'Sen', 1).count * 100).to_s + '%)'
puts

print "Male Representatives: "
print Legislator.where('title = ? AND gender = ? AND in_office = ?', 'Rep', 'M', 1).count
print ' (' + (Legislator.where('title = ? AND gender = ? AND in_office = ?', 'Rep', 'M', 1).count.to_f / 
	   Legislator.where('title = ? AND in_office = ?', 'Rep', 1).count * 100).to_s + '%)'
puts
puts


Legislator.select('state, count(*) as s_count').group('state').order('s_count DESC').each {|l| puts "#{l.state} | #{l.s_count}"}
puts
puts

puts "Senators: #{Legislator.where('title = ?', 'Sen').count}"
puts "Representatives: #{Legislator.where('title = ?', 'Rep').count}"
puts
puts

Legislator.where(in_office: 0).destroy_all
puts "Senators: #{Legislator.where('title = ?', 'Sen').count}"
puts "Representatives: #{Legislator.where('title = ?', 'Rep').count}"