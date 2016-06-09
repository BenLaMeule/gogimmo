class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :city
      t.integer :price
      t.float :surface
      t.integer :room

      t.timestamps null: false
    end
  end
end
