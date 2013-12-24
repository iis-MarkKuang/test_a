require 'spec_helper'

describe Description do 

  it { should belong_to :user }
  it { should belong_to :product }
  it { should belong_to :document }

  context "for a user with existing descriptions" do
    let!(:user) { User.create }
    let!(:existing) { Description.create(user_id: user) }
    it "does not allow a new description added with the same user_id" do
      description = Description.new(user_id: user)
      expect(description).to be_invalid
    end
  end

end
