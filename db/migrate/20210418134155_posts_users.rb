class PostsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_users, id: false do |t|
      t.belongs_to :post
      t.belongs_to :user
    end
  end
end
