class AddInternalNameToAssetClass < ActiveRecord::Migration[6.0]
  def change
    add_column :asset_classes, :internal_name, :string
  end
end
