class AddFieldsToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :zip_code, :string
    add_column :annonces, :sector, :string
  end
end
