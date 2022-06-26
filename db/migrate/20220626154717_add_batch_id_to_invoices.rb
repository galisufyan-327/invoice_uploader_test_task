class AddBatchIdToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :invoice_batch_id, :integer
  end
end
