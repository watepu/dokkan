20.times do |n|
  title = Faker::Book.title
  headline = Faker::Book.genre
  content = Faker::StarWars.quote
  user_id = Faker::Number.between(1, 8)

  Book.create(
    title: title,
    headline: headline,
    content: content,
    user_id: user_id,
  )
end
