class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :message_body, type: String
  field :release_date, type: Date
  field :state, type: Integer

  validates :message_body, presence: true
  validates :release_date, presence: true
end
