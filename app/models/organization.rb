class Organization < ActiveRecord::Base
	attr_accessible :name
  has_many :followings, :class_name => 'Following', :as => :followed, :dependent => :destroy
  has_many :followers, :class_name => 'User', through: :followings, :as => :followed, :dependent => :destroy
end