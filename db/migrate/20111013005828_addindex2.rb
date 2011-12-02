class Addindex2 < ActiveRecord::Migration
  def up
		add_index :messages, [:created_at, :name]

  end

  def down
  end
end
