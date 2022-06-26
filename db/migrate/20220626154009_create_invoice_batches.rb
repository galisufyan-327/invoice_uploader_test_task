class CreateInvoiceBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_batches do |t|
      t.string :batch_file
      t.string :name

      t.timestamps
    end
  end
end
