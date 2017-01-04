class User < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :password, presence: true,
    length: { in: 6..20 },
    format: { with: /[!$#]/ }
  has_many :phones
  validates_length_of :phones, maximum: 2
end
