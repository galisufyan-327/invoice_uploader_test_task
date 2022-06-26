class InvoiceBatchesController < ApplicationController

  before_action :set_invoice_batch, only: [:show, :destroy]

  def index
    @invoice_batch = InvoiceBatch.new
    @invoice_batches = InvoiceBatch.all
  end

  def create
    @invoice_batch = InvoiceBatch.new(invoice_batch_params)
    @invoice_batch.save
    flash[:notice] = "Invoice Batch Created Successfully"
    redirect_back_or_to root_url
  end

  def destroy
    @invoice_batch.destroy
    flash[:notice] = "Invoice Batch Deleted Successfully"
    redirect_back_or_to root_url
  end

  private

  def invoice_batch_params
    params.require(:invoice_batch).permit(:batch_file)
  end

  def set_invoice_batch
    @invoice_batch = InvoiceBatch.find(params[:id])
  end
end
