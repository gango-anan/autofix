class User < ApplicationRecord
  has_secure_password
  after_create :create_default_groups
  default_scope -> { order(:id) }

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, length: { within: 4..20 }
  validates :password, length: { within: 6..25 }

  has_many :expenditures, class_name: 'Expenditure', foreign_key: 'author_id'
  has_many :groups, dependent: :destroy

  def total_amount
    self.expenditures.sum(:amount)
  end

  def total_amount_for_un_grouped_exps
    self.expenditures.un_grouped_expenditures.sum(:amount)
  end

  private
  
  def create_default_groups
    Group.create(name: 'tyre-clinic', user_id: id, icon: 'tyre.png')
    Group.create(name: 'service', user_id: id, icon: 'service.jpeg')
    Group.create(name: 'body', user_id: id, icon: 'body.jpeg')
    Group.create(name: 'engine', user_id: id, icon: 'engine.jpeg')
    Group.create(name: 'diagnostics', user_id: id, icon: 'diagnosis.jpeg')
    Group.create(name: 'electronics', user_id: id, icon: 'electronics.jpeg')
    Group.create(name: 'brakes', user_id: id, icon: 'brakes.jpeg')
    Group.create(name: 'suspension', user_id: id, icon: 'suspension.png')
    Group.create(name: 'transmission', user_id: id, icon: 'transmission.jpeg')
  end
end
