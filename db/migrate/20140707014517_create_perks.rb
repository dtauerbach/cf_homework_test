class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :title
      t.text :text
      t.decimal :amount, precision: 20, scale: 6, default: 0.0
      t.references :campaign
      t.timestamps
    end
    add_index :perks, :id
    add_index :perks, :campaign_id

  end
end
