class CreateAuthTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :auth_tokens do |t|
      t.string :jti
      t.string :aud
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :auth_tokens, :jti, unique: true
    add_index :auth_tokens, :aud
  end
end
