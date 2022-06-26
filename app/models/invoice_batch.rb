class InvoiceBatch < ApplicationRecord
  require 'csv'

  mount_uploader :batch_file, InvoiceUploader
  mount_uploader :errors_csv, InvoiceUploader

  before_create :set_name
  after_create :create_invoices

  has_many :invoices, dependent: :destroy

  def create_invoices
    errors_file_path = "#{Rails.root}/public/files/errors_csv#{self.id}.csv"
    CSV.open(errors_file_path, "a+") do |erors_csv|
      erors_csv << ["internal_id", "amount", "Due Date", "Errors"]
    end

    self.errors_csv = File.new(errors_file_path)
    self.save!
    File.delete(errors_file_path) if File.exist?(errors_file_path)
    CreateInvoicesJob.perform_later(invoice_batch: self)
  end

  private

  def set_name
    if InvoiceBatch.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).count > 0
      self.name = "#{Date.today.to_s} (#{InvoiceBatch.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).count})"
    else
      self.name = Date.today.to_s
    end
  end
end
