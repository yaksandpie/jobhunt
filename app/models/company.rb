class Company < ActiveRecord::Base
  belongs_to :user
  has_many :positions, dependent: :destroy
  has_many :interviews, through: :positions
end
