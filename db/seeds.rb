# answer = ["a", "b", "c", "d"]

# num = 1

10.times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name,
              age: rand(1..100),
              gender: ["male","female"].sample,
              location: Faker::Address.state,
              password:  password,
              password_digest: password,
              email: Faker::Internet.email,
              pic_url: Faker::Avatar.image,
              tagline: Faker::Lorem.sentence,
              about: Faker::Lorem.paragraph )
  # looped_user = User.find(num)
  # looped_user.survey = Survey.create(answer1: answer.sample, answer2: answer.sample, answer3: answer.sample)
  # num += 1
end





