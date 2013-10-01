
user = User.create({ first_name: "Frederick",
                      last_name: "Twistleton",
                      email: "UncleFred@test.com",
                      password: "test123",
                      password_confirmation: "test123",
                      username: "unclefredshouse" })

user.groups.create(name: "All")
