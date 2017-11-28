# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

defaultTheater = Theater.where(title: 'Royal Default Theater').first
defaultTheater.delete if defaultTheater

theaters = Theater.create([title: 'Royal Default Theater', description: 'example of a theater whithout any theaters, seats, etc.'])
