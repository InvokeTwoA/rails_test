class Addindex < ActiveRecord::Migration
  def up
		add_index :messages, :name
		add_index :messages, :created_at
  end

  def down
  end
end
