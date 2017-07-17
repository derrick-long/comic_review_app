require 'rails_helper'

  describe Vote do

    it { should have_valid(:value).when(-1,0,1) }
    it { should_not have_valid(:value).when('djbjs', 2, -3, 47) }


    it { should_not have_valid(:review_id).when(nil, ' ') }


    it { should_not have_valid(:user_id).when(nil, ' ') }

end
