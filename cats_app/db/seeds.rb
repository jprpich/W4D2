# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

Cat.create!(birth_date: '2018/01/20', color: 'green', name: 'tommy', sex: 'M', description: 'beautiful cat')
Cat.create!(birth_date: '2015/01/20', color: 'red', name: 'jimmy', sex: 'M', description: 'cool cat')
Cat.create!(birth_date: '2009/01/20', color: 'blue', name: 'johnny', sex: 'M', description: 'ugly cat')
Cat.create!(birth_date: '1884/01/20', color: 'red', name: 'josh', sex: 'M', description: 'swift cat')
Cat.create!(birth_date: '1992/01/20', color: 'yellow', name: 'christian', sex: 'M', description: 'quick cat')

CatRentalRequest.create(cat_id: Cat.first.id, start_date: '01-01-2018', end_date: '07-01-2018', status: 'APPROVED')
CatRentalRequest.create(cat_id: Cat.first.id, start_date: '16-01-2018', end_date: '24-01-2018', status: 'APPROVED')
CatRentalRequest.create(cat_id: Cat.first.id, start_date: '02-01-2018', end_date: '10-01-2018', status: 'PENDING')

