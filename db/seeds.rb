require 'faker'
 
# Create Guests
10.times do
   guest = Guest.create!(
     firstname: Faker::Name.first_name,
     lastname: Faker::Name.last_name, 
     phone: Faker::PhoneNumber.cell_phone,
     email: Faker::Internet.email,     
   )
 end
 guests = Guest.all


# Create Party
5.times do
  party = Party.create!(
    title:  Faker::Lorem.sentence,
    starttime: Faker::Time.backward(14, :evening),
    endtime: Faker::Time.forward(23, :morning),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone
  )
end
parties = Party.all


puts "Seed finished"
puts "#{Guest.count} guests created"
puts "#{Party.count} parties created"