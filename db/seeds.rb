# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurant1 = User.create(:email => "hudsons@gmail.com", :password => "password", :password_confirmation => "password")
taker1 = User.create(:email => "123@gmail.com", :password => "password", :password_confirmation => "password", :giver => false)
