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

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #======== MATCHER ALGORITHIM =========

#returns an array of the current user's answer_ids
  def user_survey_answers
    self.selections.map{ |selection| selection.answer_id }
  end

  def all_others_survey_answers(class_name)
    class_name.all.map do |obj|
      {obj.id => [obj.user_survey_answers]}
    end
  end

  def create_matches

  end

end


#====== this worked in the console ======

=begin
test = User.all.map do |this_user|
{this_user.id => this_user.selections.map{|sel| sel.answer_id}}
end
=end
