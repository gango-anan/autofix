class User < ApplicationRecord
  has_secure_password
  default_scope -> { order(:id) }

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, length: { within: 4..20 }
  validates :password, length: { within: 6..25 }

  has_many :expenditures, class_name: 'Expenditure', foreign_key: 'author_id'
  has_many :groups, dependent: :destroy

  def total_amount
    return 0 unless expenditures

    expenditures.sum(:amount)
  end

  def total_amount_for_un_grouped_exps
    return 0 unless expenditures

    expenditures.un_grouped_expenditures.sum(:amount)
  end
end
