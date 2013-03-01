class Following < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id, :followed_type

  belongs_to :follower, class_name: "User"
  belongs_to :followed, :polymorphic => true
end