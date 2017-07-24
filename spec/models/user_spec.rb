require 'rails_helper'

RSpec.describe User, type: :model do 
	it 'is not a valid email' do
		user = User.new
		user.should_not be_valid
	end
end