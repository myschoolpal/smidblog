class User < ActiveRecord::Base
  has_many :articles
  validates :forename, presence: true
	validates :surname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
