class ChangeColumnBillPayer < ActiveRecord::Migration
  def change
  	change_column(:bills, :payer, :integer)
  end
end
