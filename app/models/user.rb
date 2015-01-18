class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message"

  has_many :senders, through: :received_messages, source: :sender
  has_many :receivers, through: :sent_messages, source: :receiver

  has_one :survey

  has_many :selections
  has_many :answers, through: :selections

  has_many :desires
  has_many :relationships, through: :desires


  # validates :name, presence:true
  # validates :email, presence:true
  # validates :email, format: {with: /[1-9]*[a-z]*\d*@[a-zA-z]*.[a-z]{3}/}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


end
