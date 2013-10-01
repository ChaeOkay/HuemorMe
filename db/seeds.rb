
user = User.create({ first_name: "Frederick",
                      last_name: "Twistleton",
                      email: "UncleFred@test.com",
                      password: "test1234",
                      password_confirmation: "test1234",
                      username: "unclefredshouse" })

user.groups.create(name: "All")
