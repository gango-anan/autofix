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
    Group.create(name: 'Tyre-Clinic', user_id: id)
    Group.create(name: 'Service', user_id: id)
    Group.create(name: 'Body', user_id: id)
    Group.create(name: 'Engine', user_id: id)
    Group.create(name: 'Diagnostics', user_id: id)
    Group.create(name: 'Electronics', user_id: id)
    Group.create(name: 'Brakes', user_id: id)
    Group.create(name: 'Suspension', user_id: id)
    Group.create(name: 'Transmission', user_id: id)
  end
end
