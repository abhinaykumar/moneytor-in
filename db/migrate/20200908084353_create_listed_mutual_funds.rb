class CreateListedMutualFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :listed_mutual_funds do |t|
      t.string :name
      t.float :nav

      t.timestamps
    end
  end
end
