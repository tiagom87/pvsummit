class AddAppliedAtToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :applied_at, :datetime
  end
end
