class Voucher < Donation
  include Mongoid::Document
  field :expires_at, type: Time  
end
