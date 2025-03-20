require 'open-uri'

description = <<-DESCRIPTION
<div>Chalé novinho que mais parece uma casa. Ideal para casais que procuram relaxar em meio à natureza. Localizado no bairro Santa Tereza com vista única para as montanhas da Serra. Venha viver dias incríveis nesse paraíso! Se você procura renovar as energias, apreciar a beleza da natureza, encontrou o lugar certo. Animais, árvores e muito ar puro!
</div>
<h4 class="font-medium" tabindex="-1">O espaço</h4>
<p>Adequado para casais, situação muito romântica. Temos a possibilidade de adicionar uma cama extra para crianças ou um possível terceiro hóspede, para o qual há uma sobretaxa de 60 euros que será paga diretamente na propriedade.</p>
<h4 class="font-medium" tabindex="-1">Outras observações</h4>
<p>No distrito do centro histórico, você pode respirar uma atmosfera feita por pessoas simples e hospitaleiras, artesanato antigo, lojas, tradições milenares e ritos cristãos que dão emoções de uma "jornada real" à descoberta que vai além das belezas do mar.</p>
DESCRIPTION

# amenity1 = Amenity.create!(name: 'Kitchen')
# amenity1.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "kitchen.svg")), filename: amenity1.name, content_type: "svg")

# amenity2 = Amenity.create!(name: 'Private pool')
# amenity2.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "private_pool.svg")), filename: amenity2.name, content_type: "svg")

# amenity3 = Amenity.create!(name: 'Wifi')
# amenity3.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "wifi.svg")), filename: amenity3.name, content_type: "svg")

# amenity4 = Amenity.create!(name: 'Essentials', description: "Toalhas, lençóis, sabonete e papel higiênico")
# amenity4.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "essentials.svg")), filename: amenity4.name, content_type: "svg")

amenities_data = [
  { name: "Ar-condicionado", icon: "air_conditioning.svg" },
  { name: "Sacada", icon: "balcony.svg" },
  { name: "Roupa de cama", icon: "bed_linen.svg" },
  { name: "Jogos de tabuleiro", icon: "board_games.svg" },
  { name: "Alarme de monóxido de carbono", icon: "carbon_monoxide_alarm.svg" },
  { name: "Cafeteira", icon: "coffee_maker.svg" },
  { name: "Fogão", icon: "cooker.svg" },
  { name: "Itens básicos", icon: "cooking_basics.svg", description: "Vasilhas, panelas, óleo, sal e pimenta" },
  { name: "Berço", icon: "cot.svg" },
  { name: "Espaço de trabalho dedicado", icon: "dedicated_workspace.svg" },
  { name: "Mesa de jantar", icon: "dining_table.svg" },
  { name: "Louças e talheres", icon: "dishes_and_cutlery.svg", description: "Tigelas, hashi, pratos, copos, etc." },
  { name: "Lava-louças", icon: "dishwasher.svg" },
  { name: "Secadora", icon: "dryer.svg" },
  { name: "Essenciais", icon: "essentials.svg", description: "Toalhas, lençóis, sabonete e papel higiênico" },
  { name: "Extintor de incêndio", icon: "fire_extinguisher.svg" },
  { name: "Kit de primeiros socorros", icon: "first_aid_kit.svg" },
  { name: "Estacionamento gratuito", icon: "free_parking.svg" },
  { name: "Geladeira", icon: "fridge.svg" },
  { name: "Jardim", icon: "garden.svg", description: "Um espaço aberto da propriedade, geralmente coberto de grama" },
  { name: "Secador de cabelo", icon: "hair_dryer.svg" },
  { name: "Cabides", icon: "hangers.svg" },
  { name: "Aquecimento", icon: "heating.svg" },
  { name: "Hidromassagem", icon: "hot_tub.svg" },
  { name: "Água quente", icon: "hot_water.svg" },
  { name: "Ferro de passar", icon: "iron.svg" },
  { name: "Cozinha", icon: "kitchen.svg", description: "Espaço onde os hóspedes podem preparar suas próprias refeições" },
  { name: "Cofre", icon: "lockbox.svg" },
  { name: "Micro-ondas", icon: "microwave.svg" },
  { name: "Vista para a montanha", icon: "mountain_view.svg" },
  { name: "Forno", icon: "oven.svg" },
  { name: "Mesa de sinuca", icon: "pool_table.svg" },
  { name: "Entrada privativa", icon: "private_entrance.svg", description: "Entrada por outra rua ou prédio" },
  { name: "Piscina privativa", icon: "private_pool.svg" },
  { name: "Shampoo", icon: "shampoo.svg" },
  { name: "Alarme de fumaça", icon: "smoke_alarm.svg" },
  { name: "TV", icon: "tv.svg" },
  { name: "Máquina de lavar", icon: "washing_machine.svg" },
  { name: "Wi-Fi", icon: "wifi.svg" }
]

amenities_data.each do |data|
  amenity = Amenity.create!(name: data[:name], icon: data[:icon], description: data[:description])
end

pictures = []
20.times do
  pictures << URI.open('https://picsum.photos/700')
end

user = User.create!({
  email: 'teste1@gmail.com',
  password: '123456',
  name: 'Marcos H. Oshiro',
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  address_1: Faker::Address.street_address
})

user.picture.attach(io: pictures[0], filename: user.name, content_type: "image/jpeg")

19.times do |i|
  random_user = User.create!({
  email: "test#{i + 2}@gmail.com",
  password: '123456',
  name: Faker::Name.name,
  city: Faker::Address.city,
  state: Faker::Address.state,
  country: Faker::Address.country,
  address_1: Faker::Address.street_address
})

  random_user.picture.attach(io: pictures[i+1], filename: user.name, content_type: "image/jpeg")
end


6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: description,
    headline: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(rand(50..500), "USD"),
    guest_count: rand(2..12),
    bedroom_count: rand(2..5),
    bed_count: rand(4..12),
    bathroom_count: rand(1..4)
})

  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{i + 1}.jpg")), filename: "property_#{i + 1}.jpg", content_type: "image/jpeg")
  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{i + 7}.jpg")), filename: "property_#{i + 2}.jpg", content_type: "image/jpeg")
  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{3}.jpg")), filename: "property_#{3}.jpg", content_type: "image/jpeg")
  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{4}.jpg")), filename: "property_#{4}.jpg", content_type: "image/jpeg")
  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{5}.jpg")), filename: "property_#{5}.jpg", content_type: "image/jpeg")

  amenity_sample  = Amenity.all.sample(rand(10..(amenities_data.length() - 1))).uniq
  property.amenities << amenity_sample


  (rand(5..10)).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 4),
      cleanliness_rating: rand(1..5),
      accuracy_rating: rand(1..5),
      checkin_rating: rand(1..5),
      communication_rating: rand(1..5),
      location_rating: rand(1..5),
      value_rating: rand(1..5),
      property: property,
      user: User.all.sample
    })
  end
end
