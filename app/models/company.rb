class Company < ActiveRecord::Base
  has_many :positions, dependent: :destroy
  has_many :interviews, through: :positions
end
