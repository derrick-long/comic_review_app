require 'rails_helper'

describe Genre do

  it { should have_valid(:genre_name).when("Fantasy") }
  it { should_not have_valid(:genre_name).when("Burrito", nil, " ") }

end
