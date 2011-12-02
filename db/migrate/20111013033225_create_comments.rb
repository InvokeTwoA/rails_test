class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references "message", :null => false
      t.integer :message_id
      t.text :name
      t.text :comment
      t.timestamps
    end
  end
end
