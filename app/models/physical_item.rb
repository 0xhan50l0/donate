class PhysicalItem < Donation
  include Mongoid::Document

  field :height, type: BigDecimal
  field :width, type: BigDecimal
  field :weight, type: BigDecimal

  validates_numericality_of :height, :greater_than_or_equal_to => 0
  validates_numericality_of :width, :greater_than_or_equal_to => 0
  validates_numericality_of :weight, :greater_than_or_equal_to => 0
end
