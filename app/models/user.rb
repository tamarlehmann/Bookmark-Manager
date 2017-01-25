require 'bcrypt'

class User

  include DataMapper::Resource

  include BCrypt

  property :id, Serial
  property :email, String
  property :password, BCryptHash, :length => 250

end
