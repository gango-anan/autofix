class Group < ApplicationRecord
  default_scope -> { order(:name) }
  validates :name, presence: true
  belongs_to :user
  has_many :expenditures, dependent: :nullify
  has_one_attached :picture
end
