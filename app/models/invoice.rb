class Invoice < ApplicationRecord

  belongs_to :invoice_batch

  before_create :set_selling_price

  validates :amount, :due_date, presence: true
  validate :due_date_cannot_be_in_the_past

  private

  def set_selling_price
    if (due_date - Date.today).to_i > 30
      disount = 0.5
    else
      disount = 0.3
    end
    self.selling_price = amount - (amount * (disount / 100.0))
  end

  def due_date_cannot_be_in_the_past
    return false if due_date.blank?

    if (due_date - Date.today) < 0
      self.errors.add(:due_date, "can't be in the past")
    end
  end
end
