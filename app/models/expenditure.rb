class Expenditure < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  scope :un_grouped_expenditures, -> { where(group_id: nil) }
  scope :grouped_expenditures, -> { where.not(group_id: nil) }
  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
end
