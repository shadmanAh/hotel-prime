#User.create!(email: 'shad@gmail.com', password: '123456', password_confirmation: '123456')

PublicActivity.enabled = false
30.times do
    Room.create!([{
        title: Faker::Lorem.word,
        description: Faker::TvShows::GameOfThrones.quote,
        user_id: User.first.id,
        short_description: Faker::Quote.famous_last_words,
        size: Faker::Number.between(from: 20, to: 50),
        view: Faker::Address.city,
        bed: Faker::Number.between(from: 1, to: 4),
        opacity: Faker::Number.between(from: 1, to: 6),
        price: Faker::Number.between(from: 50, to: 200)
    }])
end
PublicActivity.enabled = true

