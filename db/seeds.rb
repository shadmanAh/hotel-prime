User.create!(email: 'shad@gmail.com', password: '123456', password_confirmation: '123456')
30.times do
    Room.create!([{
        title: Faker::Lorem.word,
        description: Faker::TvShows::GameOfThrones.quote,
        user_id: User.first.id,
    }])
end
