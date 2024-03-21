class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :url
      t.integer :views

      t.timestamps
    end
  end
end
