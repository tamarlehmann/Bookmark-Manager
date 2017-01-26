require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  include BCrypt

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true,
    :messages => {
      :presence => "Please enter your email address",
      :format => "Please enter a valid email address",
      :is_unique => "A user with this email address already exists"
    }
  property :password, BCryptHash, :length => 250
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

end
