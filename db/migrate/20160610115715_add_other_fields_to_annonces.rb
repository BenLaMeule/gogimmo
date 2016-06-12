class AddOtherFieldsToAnnonces < ActiveRecord::Migration
  def change
    add_column :annonces, :update, :date
    add_column :annonces, :website, :string
    add_column :annonces, :prix_metre_carre, :float
  end
end
