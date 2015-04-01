class Interview < ActiveRecord::Base
  belongs_to :position
  has_one :company, through: :position

  def position_at_company
    "#{position.title} at #{position.company.name}"
  end
end
