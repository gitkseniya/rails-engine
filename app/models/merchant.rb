class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.search_by_name(name)
    where('name ILIKE ?', "%#{name}%").order(:name)
    .first
  end

  def self.most_items_sold(quantity)
    joins(:transactions)
      .select('merchants.*, sum(invoice_items.quantity) as sold_items')
      .where('transactions.result = ?', 'success')
      .group(:id)
      .order('sold_items DESC')
      .limit(quantity)
  end

  def count_items_sold
    transactions.where('transactions.result = ?', 'success')
                .pluck('sum(invoice_items.quantity)')
                .first
  end
end
