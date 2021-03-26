class Group < ApplicationRecord
  default_scope -> { order(:name) }
  scope :user_groups, -> { where(user: Current.user) }
  validates :name, presence: true
  belongs_to :user
  has_many :expenditures, dependent: :nullify
  has_one_attached :picture
end
