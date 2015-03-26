class Interview < ActiveRecord::Base
  belongs_to :position
  has_one :company, through: :position
end
