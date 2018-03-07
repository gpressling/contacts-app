require "unirest"

system "clear"
puts "Choose an Contact: "
puts "[1] Contact 1"
puts "[2] Contact 2"
puts "[3] Contact 3"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/first_contact")
  contact = response.body
  p contact
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/v1/second_contact")
  contact = response.body
  p contact
elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/v1/third_contact")
  contact = response.body
  puts contact
end