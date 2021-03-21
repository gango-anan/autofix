class Expenditure < ApplicationRecord
  default_scope -> { order(:id) }
  
  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
end
