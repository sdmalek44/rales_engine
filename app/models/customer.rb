class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
      .select("merchants.*, sum(invoice_items.quantity) AS total_sales")
      .joins(:invoices, :invoice_items)
      .group(:id)
      .order("total_sales DESC")
      .limit(1)
      .first
  end
end
