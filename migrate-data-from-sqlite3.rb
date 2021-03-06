#!/usr/bin/env ruby

require 'sqlite3'
require 'mysql'

USER="root"
PWD="foo123"

db = SQLite3::Database.new("db/development.sqlite3")
db.results_as_hash = true
con = Mysql.new 'localhost', USER, PWD, 'sod_spells'

db.execute( "select * from effect_types" ).each do |row|
	con.query("INSERT INTO effect_types(id, name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "')")
	#puts row["id"].to_s
end

puts "Done writing effect_types"

db.execute( "select * from target_types" ).each do |row|
	con.query("INSERT INTO target_types(id, name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "')")
	#puts row["id"].to_s
end

puts "Done writing target_types"

db.execute( "select * from resist_types" ).each do |row|
	con.query("INSERT INTO resist_types(id, name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "')")
	#puts row["id"].to_s
end

puts "Done writing resist_types"

db.execute( "select * from zone_types" ).each do |row|
	con.query("INSERT INTO zone_types(id, name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "')")
	#puts row["id"].to_s
end


puts "Done writing zone_types"

db.execute( "select * from skill_types" ).each do |row|
	con.query("INSERT INTO skill_types(id, name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "')")
	#puts row["id"].to_s
end

puts "Done writing skill_types"

db.execute( "select * from reagents" ).each do |row|
	con.query("INSERT INTO reagents(id, name) VALUES(" + row["id"].to_s + ", '" + Mysql.escape_string(row["name"].to_s) + "')")
	#puts row["id"].to_s
end

puts "Done writing reagents"

db.execute( "select * from char_classes" ).each do |row|
	con.query("INSERT INTO char_classes(id, name, long_name) VALUES(" + row["id"].to_s + ", '" + row["name"].to_s + "', '" + row["long_name"].to_s + "')")
	#puts row["id"].to_s
end

puts "Done writing char_classes"
