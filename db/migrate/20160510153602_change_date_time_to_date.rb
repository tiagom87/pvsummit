class ChangeDateTimeToDate < ActiveRecord::Migration
  def change
  	change_column :applications, :founding_date, :date
  end
end
