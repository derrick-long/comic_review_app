require 'rails_helper'

describe Review do

  it { should have_valid(:content).when("A Good Book") }
  it { should have_valid(:rating).when(5) }

  it { should_not have_valid(:content).when(" ", nil, "A"*701) }
  it { should_not have_valid(:rating).when("A million", nil) }

end
