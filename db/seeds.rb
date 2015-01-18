# answer = ["a", "b", "c", "d"]

# num = 1

10.times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name,
              age: rand(1..100),
              gender: ["male","female"].sample,
              orientation: ["Lesbian","Gay","Bisexual","Pansexual", "Straight", "Asexual", "Prefer not to Say"].sample,
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





### SEED SURVEY QUESTIONS ###

# survey = Survey.create(title: "Initial Survey")
# survey.questions.create(description: "Tupac or Biggie?")
# survey.questions.find(1).answers.create(description: "Tupac")
# survey.questions.find(1).answers.create(description: "Biggie")
# survey.questions.create(description: "Pink or Pink?")
# survey.questions.find(2).answers.create(description:  "Pink")
# survey.questions.find(2).answers.create(description:"Pinker Pink")
# survey.questions.create(description: "Left-handed or Right-handed?")
# survey.questions.find(3).answers.create(description: "Left-handed")
# survey.questions.find(3).answers.create(description: "Right-handed")
# survey.questions.create(description: "Cats or Dogs?")
# survey.questions.find(4).answers.create(description: "Cats")
# survey.questions.find(4).answers.create(description: "Dogs")
# survey.questions.create(description: "Coffee or Tea?")
# survey.questions.find(5).answers.create(description: "Coffee")
# survey.questions.find(5).answers.create(description: "Tea")

survey_qs = ["Tupac or Biggie?", "Pink or Pink?", "Left-handed or Right-handed?", "Cats or Dogs?", "Coffee or Tea?"]
survey_ans = [["Tupac","Biggie"],["Pink","Pinker Pink"],["Left-handed", "Right-handed"],["Cats","Dogs"],["Coffee","Tea"]]


Survey.create(title: "Initial Survey")

10.times do  |i|
  Survey.first.questions.create(description: survey_qs[i])
end

num_questions = survey_qs.length

num_questions.times do |i|
  Survey.first.questions.find(i + 1).answers.create(description: survey_ans[i][0])
  Survey.first.questions.find(i + 1).answers.create(description: survey_ans[i][1])
end

