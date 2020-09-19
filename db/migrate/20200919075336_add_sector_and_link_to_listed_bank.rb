class AddSectorAndLinkToListedBank < ActiveRecord::Migration[6.0]
  def change
    add_column :listed_banks, :sector, :string
    add_column :listed_banks, :website, :string
  end
end
