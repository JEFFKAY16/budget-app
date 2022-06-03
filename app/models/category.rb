class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_payments
  has_many :payments, through: :category_payments
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 250 }

  def recent_payments
    payments.order('id DESC')
  end
end
