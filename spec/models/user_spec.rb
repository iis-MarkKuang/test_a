require 'spec_helper'

describe User do 

  it "should be valid with basic attributes" do
    user = User.new(description: 'foo', user_name: 'foobaz')
    expect(user).to be_valid
  end

end
