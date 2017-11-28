# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

welcomeConcert = Concert.where(title: 'Welcome').first
welcomeConcert.delete if welcomeConcert

concerts = Concert.create([title: 'Welcome', description: 'example of a concert or event in no theater or date in particular'])
