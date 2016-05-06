class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :company_name
      t.text :company_description
      t.string :website_url
      t.bigint :nif
      t.text :founding_team
      t.text :team_description
      t.string :email
      t.datetime :founding_date
      t.string :funding_to_date
      t.text :activity
      t.text :product_description
      t.text :customers
      t.text :business_model
      t.text :future
      t.string :pitch_url
      t.integer :user_id, null: false
      t.string :aasm_state, default: "started"

      t.timestamps null: false
    end
  end
end
