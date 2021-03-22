class User < ApplicationRecord
  has_secure_password
  after_create :create_default_groups
  default_scope -> { order(:id) }

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, length: { within: 4..20 }
  validates :password, length: { within: 6..25 }

  has_many :expenditures, dependent: :destroy
  has_many :groups, dependent: :destroy

  private
  
  def create_default_groups
    Group.create(name: 'tyre-clinic', user_id: id)
    Group.create(name: 'service', user_id: id)
    Group.create(name: 'body', user_id: id)
    Group.create(name: 'engine', user_id: id)
    Group.create(name: 'diagnostics', user_id: id)
    Group.create(name: 'electronics', user_id: id)
    Group.create(name: 'brakes', user_id: id)
    Group.create(name: 'suspension', user_id: id)
    Group.create(name: 'transmission', user_id: id)
  end
end
