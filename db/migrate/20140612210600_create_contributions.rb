class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.decimal :amount, precision: 20, scale: 6, default: 0.0
      t.references :user
      t.references :campaign
      t.timestamps
    end
    add_index :contributions, :id
    add_index :contributions, :user_id
    add_index :contributions, :campaign_id
  end
end
