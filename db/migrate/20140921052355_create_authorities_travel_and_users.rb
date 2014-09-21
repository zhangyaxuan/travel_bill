class CreateAuthoritiesTravelAndUsers < ActiveRecord::Migration
  def change
    create_table :authorities_travel_and_users, :id=>false do |t|
      t.integer :user_id
      t.integer :travel_id

      t.timestamps
    end
  end
end
