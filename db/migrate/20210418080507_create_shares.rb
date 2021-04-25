class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.string :share_with
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
