require 'rails_helper'

describe Comic do
    it { should have_valid(:title).when("A Good Book") }
    it { should_not have_valid(:title).when(nil, " ") }

    it { should have_valid(:author).when("Guy Person") }
    it { should_not have_valid(:author).when(nil, " ","A") }

    it { should have_valid(:description).when("A Good Book About Stuff", nil) }
    it { should_not have_valid(:description).when("A", "A"*252) }

    #add additonal validations as we go here
end
