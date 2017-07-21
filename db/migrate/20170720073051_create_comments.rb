class CreateComments < ActiveRecord::Migration[5.1]
  def change
    #add_reference :users, foreign_key: true
    #add_reference :groups, foreign_key: false
    create_table :comments do |t|
      t.integer :user_id, foreign_key: true
      t.integer :group_id
      t.text :message

      t.timestamps
    end
    #, foreign_key: true
    #create_join_table :users, :groups, foreign_key: true
  end
end
