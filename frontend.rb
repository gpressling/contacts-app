require "unirest"

puts "Log in!"
print "Email: "
email = "greg@email.com"
print "Password: "
password = "password"
response = Unirest.post("http://localhost:3000/user_token", 
  parameters: {
    auth: {
      email: email,
      password: password
    }
  }
)
jwt = response.body["jwt"]
Unirest.default_header("Authorization", "Bearer #{jwt}")
if input_option == "log out"
  jwt = ""
  Unirest.clear_default_headers()
end

system "clear"
puts "[1] Signup"
system "clear"
puts "Choose an Contact: "
puts "[1] See all contacts"
puts "[2] Show one contact"
puts "[3] Create a contact"
puts "[4] Update a contact"
puts "[5] Delete a contact"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body
  p contacts
elsif input_option == "1.1"
  print "enter contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts?query=#{contact_id}")
  contacts = response.body
  puts JSON.pretty_generate(contacts)
elsif input_option == "2"
  print "enter contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  contacts = response.body
  puts JSON.pretty_generate(contacts)
elsif input_option == "3"
  params = {}
  print "Contact first_name: "
  params["first_name"] = gets.chomp
  print "first_name: "
  params["last_name"] = gets.chomp
  print "last_name: "
  params["email"] = gets.chomp
  print "Directions: "
  params["phone_number"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "4"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  contact = response.body
  params = {}
  print "Title (#{contact["first_name"]}): "
  params["first_name"] = gets.chomp
  print "last_name (#{contact["last_name"]}): "
  params["last_name"] = gets.chomp
  print "email (#{contact["email"]}): "
  params["email"] = gets.chomp
  print "phone_number (#{contact["phone_number"]}): "
  params["phone_number"] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{contact_id}", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "5"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/contacts/#{contact_id}")
  body = response.body
  puts JSON.pretty_generate(body)
end