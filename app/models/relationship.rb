class Relationship < ActiveRecord::Base
  # Remember to create a migration!
  has_many :desires
  has_many :users, through: :desires
end
