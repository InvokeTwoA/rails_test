class CreateHoges < ActiveRecord::Migration
  def change
    create_table :hoges do |t|

      t.timestamps
    end
  end
end
