class CreateDesires < ActiveRecord::Migration
  def change
    create_table :desires do |t|
      t.references :user
      t.references :relationship
      t.timestamps
    end
  end
end
