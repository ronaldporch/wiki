# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = []
25.times do |n|
  user[n] = User.create(email: Faker::Internet.email, password: "password", encrypted_password: User.new.send(:password_digest, 'password'))
end

50.times do
  Article.create(name: Faker::Name.name, content: Faker::Lorem.paragraph(3), users: user)
end
