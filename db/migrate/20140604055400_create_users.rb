class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :login_count, default: 0
      t.boolean :admin, default: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
