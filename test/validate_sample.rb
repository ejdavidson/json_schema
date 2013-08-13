require 'rubygems'
require 'json-schema'
require 'json'
require 'pp'

json_schema_schema = File.open("draft-04.json", "rb").read
json_schema = File.open("schema_mock_grades.trail_1.json", "rb").read
json_instance = File.open("mock_grades.trail_1.json", "rb").read

#puts json_instance
puts json_schema
#puts PP.pp(JSON.parse(json_schema))

begin
  the_schema_schema = JSON.parse(json_schema_schema)
  the_schema = JSON.parse(json_schema)
  JSON::Validator.validate!(the_schema_schema, the_schema)
  the_instance = JSON.parse(json_instance)
  JSON::Validator.validate!(the_schema, the_instance)
  puts "It is valid"
rescue JSON::Schema::ValidationError
  puts $!.message
end

