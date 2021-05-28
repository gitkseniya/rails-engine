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
end
