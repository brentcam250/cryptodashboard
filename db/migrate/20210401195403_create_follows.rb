class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id #user
      t.string :followable_type 
      t.integer :followable_id 

      t.timestamps
    end
  end
end
