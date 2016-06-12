class RemoveUpdateToAnnonces < ActiveRecord::Migration
  def change
    remove_column :annonces, :update
  end
end
