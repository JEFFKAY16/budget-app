class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_payments
  has_many :payments, through: :category_payments

  def recent_payments
    payments.order('id ASC')
  end
end
