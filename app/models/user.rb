class User < ActiveRecord::Base
	attr_accessible :name
  has_many :followings, foreign_key: "follower_id", dependent: :destroy
 
  has_many :reverse_followings, foreign_key: "followed_id", dependent: :destroy, class_name: 'Following'
  has_many :followers, :class_name => 'User', through: :reverse_followings, :as => :followed
 
  has_many :followed_users, :class_name => 'User', through: :followings, :source => :follower
  has_many :followed_organizations, :class_name => 'Organization', through: :followings, :source => :follower


  def follow!(other_thing)
  	unless Following.exists?(:follower_id => self.id, :followed_id => other_thing.id, :followed_type => other_thing.class.to_s)
  		Following.create!(:follower_id => self.id, :followed_id => other_thing.id, :followed_type => other_thing.class.to_s)
  	end
  end

  def following?(other_thing)
  	return Following.exists?(:follower_id => self.id, :followed_id => other_thing.id, :followed_type => other_thing.class.to_s)
  end

end