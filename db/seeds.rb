# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts

# Users
admin = User.create!(
  mail: 'noreply@uc.cl',
  name: 'Felipe del Rio',
  username: 'fdelrio89',
  password: 'adminadmin',
  amount: 99_999,
  role: :admin
)
figarrido = User.create!(
  mail: 'figarrido@uc.cl',
  name: 'Felipe Garrido',
  username: 'figarrido',
  password: '123123',
  amount: 1500,
  role: :user
)
aaossa = User.create!(
  mail: 'aaossa@uc.cl',
  name: 'Antonio Ossa',
  username: 'aaossa',
  password: '123123',
  amount: 1500,
  role: :user
)
puts 'Users:'
puts "#{admin.username}, #{admin.password}"
puts "#{figarrido.username}, #{figarrido.password}"
puts "#{aaossa.username}, #{aaossa.password}"
puts

# Raffles
puts 'Raffles:'
[figarrido, aaossa].each do |user|
  user.raffles.create!(
    title: "#{user.username}'s raffle",
    description: "A raffle created by #{user.name}",
    price: 300,
    private: false,
    number_amount: 10,
    start_date: Time.now.to_datetime + 1.hour,
    end_date: Time.now.to_datetime + 1.day + 1.hour
  )
  puts "#{user.username} => #{user.raffles.last.title}"
end
puts

# Finished raffles
puts 'Finished raffles:'
[figarrido, aaossa].each do |user|
  user.raffles.new(
    title: "#{user.username}'s finished raffle",
    description: "A raffle created by #{user.name}",
    price: 300,
    private: false,
    number_amount: 10,
    start_date: Time.now.to_datetime - 7.days,
    end_date: Time.now.to_datetime - 4.days
  ).save(validate: false)
  # Skip "Can not start in the past" validation
  puts "#{user.username} => #{user.raffles.last.title}"
end
puts

# Transactions
puts 'Requests:'
[figarrido, aaossa].each do |user|
  user.requests.create!(
    amount: 200,
    approved: false
  )
  puts "#{user.username} => #{user.requests.last.amount}"
end
puts
