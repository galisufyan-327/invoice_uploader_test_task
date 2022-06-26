class CreateInvoicesJob < ApplicationJob
  queue_as :high_priority

  def perform(invoice_batch:)
    # Do something later
    if !File.exist?(invoice_batch.batch_file.path)
      # When file loaded with delay
      CreateInvoicesJob.perform_later(invoice_batch: invoice_batch)
      return
    end
    records = CSV.read(invoice_batch.batch_file.path)
    CSV.open(invoice_batch.errors_csv.path, "a+") do |erors_csv|
      records.drop(1).each_with_index do |row, index|
        internal_id = row[0]
        amount = row[1]
        due_date = row[2]

        invoice = invoice_batch.invoices.create(internal_id: internal_id, amount: amount, due_date: due_date)

        if invoice.errors.present?
          erors_csv << [internal_id, amount, due_date, invoice.errors.full_messages.to_sentence]
        end
      end
    end
  end
end
