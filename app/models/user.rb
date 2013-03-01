class User < ActiveRecord::Base
	attr_accessible :name
  has_many :followings, foreign_key: "follower_id", dependent: :destroy
 
  has_many :reverse_followings, foreign_key: "followed_id", dependent: :destroy, class_name: 'Following'
  has_many :followers, :class_name => 'User', through: :reverse_followings, :as => :followed
 
  has_many :followed_users, :class_name => 'User', through: :followings, :source => :follower
  has_many :followed_organizations, :class_name => 'Organization', through: :followings, :source => :follower
end