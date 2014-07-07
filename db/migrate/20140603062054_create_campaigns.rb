class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.decimal :total, precision: 20, scale: 6, default: 0.0
      t.references :user
      t.timestamps
    end
    add_index :campaigns, :id
    add_index :campaigns, :user_id
  end
end
