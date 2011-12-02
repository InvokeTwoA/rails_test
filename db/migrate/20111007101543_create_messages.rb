class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :name, :string , :null => false
      t.column :comment, :string
      t.column :del_flag,:boolean 
      t.timestamps
    end
  end
end
