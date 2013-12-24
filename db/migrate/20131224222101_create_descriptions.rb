class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.belongs_to :document, index: true

      t.timestamps
    end
  end
end
