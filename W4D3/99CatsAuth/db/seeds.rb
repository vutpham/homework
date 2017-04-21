# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(user_name: 'vu', password: 'password')
user2 = User.create(user_name: 'robin', password: 'password')

cat1 = Cat.create(birth_date: '2017/03/02',color: 'black', name: 'kittycat', sex: 'M', user_id: user1.id)
cat2 = Cat.create(birth_date: '2014/12/12',color: 'orange', name: 'kootycat', sex: 'F', user_id: user2.id)
cat3 = Cat.create(birth_date: '2014/12/12',color: 'orange', name: 'kutycat', sex: 'F', user_id: user2.id)
cat4 = Cat.create(birth_date: '2014/12/12',color: 'orange', name: 'katycat', sex: 'F', user_id: user2.id)
cat5 = Cat.create(birth_date: '2014/12/12',color: 'orange', name: 'kotycat', sex: 'F', user_id: user1.id)
cat6 = Cat.create(birth_date: '2014/4/20',color: 'orange', name: '420cat', sex: 'F', user_id: user1.id)



r1 = CatRentalRequest.create(user_id: user2.id, cat_id: cat1.id, start_date: '2017/02/02', end_date: '2017/02/14')
r2 = CatRentalRequest.create(user_id: user1.id, cat_id: cat2.id, start_date: '2017/02/02', end_date: '2017/02/14')
