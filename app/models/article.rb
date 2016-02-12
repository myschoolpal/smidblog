class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: {minimum: 3, maximum: 50}
 	validates :content, presence: true, length: {minimum: 10, maximum: 5000}
 	validates :image, presence: true
 	validates :user_id, presence: true
end
