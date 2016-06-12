class AddMajToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :maj, :date
  end
end
