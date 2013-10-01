
user = User.create({ first_name: "Frederick",
                      last_name: "Twistleton",
                      email: "unclefred@test.com",
                      password: "test",
                      password_confirmation: "test",
                      username: "unclefredshouse" })

user.groups.create(name: "All")
