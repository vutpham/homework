# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

house1 = House.create(address: '123 House')
house2 = House.create(address: '456 House')
house3 = House.create(address: '789 House')

person1 = Person.create(name: 'Vu', house_id: house1.id)
person2 = Person.create(name: 'Bao', house_id: house2.id)
person3 = Person.create(name: 'Jesse', house_id: house3.id)
