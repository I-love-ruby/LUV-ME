class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :user
      t.integer :match_id
      t.float   :percentage
    end
  end
end
