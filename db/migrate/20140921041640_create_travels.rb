class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :name
      t.string :creater

      t.timestamps
    end
  end
end
