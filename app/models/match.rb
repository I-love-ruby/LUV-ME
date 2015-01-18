class Match < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :match, class_name: "User"


  def self.match_percentage


  end
end
