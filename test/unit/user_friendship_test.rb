require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without raising exception" do
		assert_nothing_raised do
			UserFriendship.create user: users(:andrew), friend: users(:zen)
		end
	end

	test "that creating a friendship based on user id and friend id works" do
      UserFriendship.create user_id: users(:andrew).id, friend_id: users(:zen).id
      assert users(:andrew).friends.include?(users(:zen))
    end
end
