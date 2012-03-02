#via the symbol ':user', we get Factory_Girl gem to simulate the User model.
Factory.define :user do |user|
  user.name                   "JenD"
  user.email                  "jendockter@gmail.com"
  user.password               "foobared"
  user.password.confirmation  "foobared"
end