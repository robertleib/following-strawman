# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
users = User.create([{:name => 'Joe Follower'},{:name => 'Steve Followed'}])
org = Organization.create({:name => 'follow me'})
followings = Following.create([{:follower_id => users[0].id, :followed_id => users[1].id, :followed_type => users[1].class.to_s},{:follower_id => users[0].id, :followed_id => org.id, :followed_type => org.class.to_s}])