class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.float :money
      t.integer :user_id
      t.integer :bill_id

      t.timestamps
    end
  end
end
