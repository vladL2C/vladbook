class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :request_id
      t.integer :requested_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
