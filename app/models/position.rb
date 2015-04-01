class Position < ActiveRecord::Base
  belongs_to :company
  has_many :interviews, dependent: :destroy

  def position_at_company
    "#{title} at #{company.name}"
  end
end
