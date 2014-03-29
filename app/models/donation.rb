class Donation
  include Mongoid::Document
  belongs_to :user

  field :title, type: String, default: ""
  field :description, type: String, default: ""
end



