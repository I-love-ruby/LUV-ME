class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.references :user
      t.timestamps
    end
  end
end
