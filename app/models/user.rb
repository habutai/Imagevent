# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime

require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #name_regex= /\A([\w+\-.+\d]+[\S])+\Z/i #need to figure out a no-whitespace regex for names!!
  
  validates :name, :presence => true,
                   :length   => {:maximum => 30},
                   :uniqueness => {:case_sensitive=>false} #case-insensitive unique username check
                   
  validates :email, :presence=> true,
                    :format  => {:with=>email_regex},
                    :uniqueness => {:case_sensitive=>false} #case-insensitive unique email check
  
  #Automatically(!) create the virtual attribute 'password confirmation'!
  validates :password,  :presence    => true,
                        :confirmation=> true,
                        :length      => {:within => 8..40}
  
  before_save :encrypt_password
  
  #return true if user's pw matches submitted pw
  def has_password?(submitted_password)
    encrypted_password==encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    #these lines explicitly check for a valid user acct as well as a valid pw; it implicitly checks for mismatched pw
  end
    
  private #keeps encryption methods from prying eyes
    def encrypt_password
      self.salt = make_salt unless has_password?(password) #this ensures the salt resets whenever the user changes their pw
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string) #since we are in the User class; Ruby knows the salt is the user's salt attribute.
      secure_hash ("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
