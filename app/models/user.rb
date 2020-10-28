class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
  #user only allowed to be required to payment once in the site
  #one-to-one connection with payment
  has_one :payment
  #user accept nested attributes of payment through form submission also
  accepts_nested_attributes_for :payment
  has_many :images
end
