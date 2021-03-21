class Group < ApplicationRecord
  validates :name, presence: true
  default_scope -> { order(:id) }
  
  belongs_to :user
  has_many :expenditures, dependent: :nullify
end
