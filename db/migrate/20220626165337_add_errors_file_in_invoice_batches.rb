class AddErrorsFileInInvoiceBatches < ActiveRecord::Migration[7.0]
  def change
    add_column :invoice_batches, :errors_csv, :string
  end
end
