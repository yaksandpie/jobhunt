class Position < ActiveRecord::Base
  belongs_to :company
  has_many :interviews, dependent: :destroy
end
