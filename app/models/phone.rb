class Phone < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
  validates :number, uniqueness: true
end
