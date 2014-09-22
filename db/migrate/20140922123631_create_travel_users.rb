class CreateTravelUsers < ActiveRecord::Migration
  def change
    create_table :travel_users do |t|
      t.integer :travel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
