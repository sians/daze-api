sian = User.create(
  username: 'siansian',
  first_name: 'Sian',
  email: 'sian.m.stone@gmail.com',
  password: 'foobar'
)

user2 = User.create(
  username: 'best_user_eva',
  first_name: 'Jennifer',
  email: 'test@test.com',
  password: 'foobar'
)


photo1 = Photo.create(user: sian, mood: 7, description: "A photo I took on the way home from work")
