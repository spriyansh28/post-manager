class CreateForwards < ActiveRecord::Migration[6.1]
  def change
    create_table :forwards do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
