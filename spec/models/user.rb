require 'spec_helper'

describe User do

	it { should respond_to(:followings) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:followed_organizations) }
  it { should respond_to(:reverse_followings) }

  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  before do
  	@user = FactoryGirl.create(:user)
  end
  
  describe "following" do
  	let(:user) { FactoryGirl.create(:user) }
  	let(:other_user) { FactoryGirl.create(:user) }    

    subject { user }

    before { user.follow!(other_user) }

    it "should be following" do
    	user.follow!(other_user)
    	user.should be_following(other_user)
    	user.followed_users should include(other_user)
    end

    describe "and unfollowing" do
      before { user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end
end