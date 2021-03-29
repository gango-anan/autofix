class Group < ApplicationRecord
  default_scope -> { order(:name) }
  scope :user_groups, -> { where(user: Current.user) }
  scope :default_groups, -> { where(user_id: nil) }
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :users
  has_many :expenditures, dependent: :nullify
  has_one_attached :picture
end
