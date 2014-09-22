class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :payer
      t.float :cost
      t.string :subject
      t.datetime :date
      t.text :comment

      # this line adds an integer column called `article_id`.
      t.references :travel, index: true

      t.timestamps
    end
  end
end
