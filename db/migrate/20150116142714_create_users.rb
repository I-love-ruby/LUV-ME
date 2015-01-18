class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :age
      t.string  :gender
      t.string  :orientation
      t.string  :location
      t.string  :password_digest
      t.string  :email
      t.string  :pic_url
      t.string  :tagline
      t.text    :about
      t.timestamps
    end
  end
end
