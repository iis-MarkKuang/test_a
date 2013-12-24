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
        expect{ document.save }.to_not change(document, :updated_at)
      end

      context "with existing products and descriptions" do
        let!(:product) { Product.create(user_id: user) }
        let!(:description) { Description.create(product_id: product, user_id: user) }
        it "raises an ActiveRecord error if 'direct-adding' the product to the document with an invalid description" do
          invalid_description = product.descriptions.build(user_id: user)
          expect{ document.update_attributes(product_ids: product.id) }.to raise_error(ActiveRecord::RecordInvalid)
        end
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
      context "with existing products and descriptions" do
        let!(:product) { Product.create(user_id: user) }
        let!(:description) { Description.create(product_id: product, user_id: user) }
        it "does not save 'direct-adding' the product to the document with an invalid description" do
          invalid_description = product.descriptions.build(user_id: user)
          expect{ document.update_attributes(product_ids: product.id) }.to_not change(document, :updated_at)
        end
      end
    end
  end

end
