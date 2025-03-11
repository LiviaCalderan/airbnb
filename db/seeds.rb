require 'open-uri'

description = <<-DESCRIPTION
<div>Chalé novinho que mais parece uma casa. Ideal para casais que procuram relaxar em meio à natureza. Localizado no bairro Santa Tereza com vista única para as montanhas da Serra. Venha viver dias incríveis nesse paraíso! Se você procura renovar as energias, apreciar a beleza da natureza, encontrou o lugar certo. Animais, árvores e muito ar puro!
</div>
<h4 class="font-medium" tabindex="-1">O espaço</h4>
<p>Adequado para casais, situação muito romântica. Temos a possibilidade de adicionar uma cama extra para crianças ou um possível terceiro hóspede, para o qual há uma sobretaxa de 60 euros que será paga diretamente na propriedade.</p>
<h4 class="font-medium" tabindex="-1">Outras observações</h4>
<p>No distrito do centro histórico, você pode respirar uma atmosfera feita por pessoas simples e hospitaleiras, artesanato antigo, lojas, tradições milenares e ritos cristãos que dão emoções de uma "jornada real" à descoberta que vai além das belezas do mar.</p>
DESCRIPTION

amenity1 = Amenity.create!(name: 'Kitchen')
amenity1.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "kitchen.svg")), filename: amenity1.name, content_type: "svg")

amenity2 = Amenity.create!(name: 'Private pool')
amenity2.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "private_pool.svg")), filename: amenity2.name, content_type: "svg")

amenity3 = Amenity.create!(name: 'Wifi')
amenity3.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "wifi.svg")), filename: amenity3.name, content_type: "svg")

amenity4 = Amenity.create!(name: 'Essentials', description: "Toalhas, lençóis, sabonete e papel higiênico")
amenity4.icon.attach(io: File.open(Rails.root.join("app", "assets", "images", "amenity_icons", "essentials.svg")), filename: amenity4.name, content_type: "svg")

pictures = []
20.times do
  pictures << URI.open(Faker::LoremFlickr.image)
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
