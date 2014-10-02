class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :article

      t.timestamps
    end
  end
end
