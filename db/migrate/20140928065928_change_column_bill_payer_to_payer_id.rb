class ChangeColumnBillPayerToPayerId < ActiveRecord::Migration
  def change
  	rename_column(:bills, :payer, :payer_id)
  end
end
