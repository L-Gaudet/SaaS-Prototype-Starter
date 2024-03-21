class AddCreatorRefToAssets < ActiveRecord::Migration[7.1]
  def change
    add_reference :assets, :creator, null: false, foreign_key: true
    add_reference :assets, :brand_owner, null: false, foreign_key: true

    create_table :brand_owners_creators, id: false do |t|
      t.belongs_to :brand_owner, index: true
      t.belongs_to :creator, index: true
    end
  end
end
