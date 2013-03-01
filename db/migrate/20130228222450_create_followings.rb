class CreateFollowings < ActiveRecord::Migration
  def up
  	create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.string :followed_type
    end

    add_index :followings, [:follower_id, :followed_id, :followed_type], :unique => true, :name => "index_uniq_on_follower_and_followed"
	end

  def down
  end
end
