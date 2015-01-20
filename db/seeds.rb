# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create name: 'a', password: 'a', password_confirmation: 'a'
link = user.links.create url: 'https://github.com/nygrenh/index', title: 'nygrenh/index'
link.tags.create name: 'Important sites', user_id: user.id, color: 'blue', link_count: 1
