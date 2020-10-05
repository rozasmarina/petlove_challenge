# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying DB..."
sleep(1)

Owner.destroy_all
Pet.destroy_all

puts 'Creating owners'

pet_counter = 0
owner_counter = 0
pet_name = ['Pé de Pano', 'Rex', 'Ajudante do Papai Noel', 'Rex', 'Flora', 'Dino', 'Lassie']
monthly_cost = ['199.99', '99.99', '99.99', '103.99', '103.99', '177.99', '407.99']
pet_type = %w[Cavalo Cachorro Cachorro Papagaio Lhama Iguana Ornitorrinco]
owner_name = ['Johnny Cash', 'Sid Vicious', 'Axl Rose', 'Joey Ramone', 'Bruce Dickinson', 'Kurt Cobain', 'Elvis Presley']
document = '555555555'
birthday = ['26/02/1932', '10/05/1957', '06/02/1962', '19/05/1951', '07/08/1958', '20/02/1967', '17/08/2008']
owners = []

7.times do
  owner = Owner.create!(
    name: owner_name[owner_counter],
    document: document,
    birthday: birthday[owner_counter]
  )
  owners << owner
  owner_counter += 1
end
puts 'Owners created'

puts 'Creating pets'
7.times do
  Pet.create!(
    name: pet_name[pet_counter],
    monthly_cost: monthly_cost[pet_counter],
    pet_type: pet_type[pet_counter],
    owner: owners[pet_counter]
  )
  pet_counter += 1
end

puts 'Pets created'
