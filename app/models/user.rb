class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :messages

  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message"

  has_many :senders, through: :received_messages, source: :sender
  has_many :receivers, through: :sent_messages, source: :receiver

  has_one :survey

end
