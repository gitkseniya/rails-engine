class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.search_by_name(name)
    where('name ILIKE ? or description LIKE ?', "%#{name}%", "%#{name}%").order(:name)
  end
end
