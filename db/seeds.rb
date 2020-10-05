# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating owners"
sleep(1)

counter = 0
pet_name = ['Pé de Pano', 'Rex', 'Ajudante do Papai Noel', 'Rex', 'Flora', 'Dino', 'Lassie']
monthly_cost = ['199.99', '99.99', '99.99', '103.99', '103.99', '177.99', '407.99']
type = %w[Cavalo Cachorro Cachorro Papagaio Lhama Iguana Ornitorrinco]
owner_name = ['Johnny Cash', 'Sid Vicious', 'Axl Rose', 'Joey Ramone', 'Bruce Dickinson', 'Kurt Cobain', 'Elvis Presley']
document = '555555555'
birthday = ['26/02/1932', '10/05/1957', '06/02/1962', '19/05/1951', '07/08/1958', '20/02/1967', '17/08/2008']

7.times do
  Pet.create!(
    name: pet_name[counter], 
    monthly_cost: monthly_cost[counter], 
    type: type[counter],
    owner: Owner.create (
      name: owner_name[counter]
      document: document,
      birthday: birthday[counter]
    )
  )
  counter += 1
end
