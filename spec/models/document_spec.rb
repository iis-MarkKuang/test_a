require 'spec_helper'

describe Document do 

  it { should belong_to :user }

  describe "validating associated models" do
    let!(:user) { User.create }
    context "for an existing document" do
      let!(:document) { Document.create }
      it "does not save if the user has an existing description" do
        existing = Description.create(user_id: user)
        new_description = document.descriptions.build(user_id: user)
        expect(document).to be_invalid
        expect{ document.save }.to_not change(Document, :count)
      end
    end
    context "for a new document" do
      let(:document) { Document.new(user_id: user) }
      it "does not save if the user has an existing description" do
        existing = Description.create(user_id: user)
        new_description = document.descriptions.build(user_id: user)
        expect(document).to be_invalid
        expect{ document.save }.to_not change(Document, :count)
      end
    end
  end

end
