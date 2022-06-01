class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', class_name: 'Category'
  has_many :payments, foreign_key: 'author_id', class_name: 'Payment'
end
