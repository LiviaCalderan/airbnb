user = User.create!({
  email: 'teste1@gmail.com',
  password: '123456'
})


6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    headline: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(rand(50..500), "USD")
})

  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{i + 1}.jpg")), filename: "property_#{i + 1}.jpg", content_type: "image/jpeg")
  property.images.attach(io: File.open(Rails.root.join("db", "images", "property_#{i + 7}.jpg")), filename: "property_#{i + 2}.jpg", content_type: "image/jpeg")

  (rand(5..10)).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 2),
      cleanliness_rating: rand(1..5),
      accuracy_rating: rand(1..5),
      checkin_rating: rand(1..5),
      communication_rating: rand(1..5),
      location_rating: rand(1..5),
      value_rating: rand(1..5),
      property: property,
      user: user
    })
  end
end
