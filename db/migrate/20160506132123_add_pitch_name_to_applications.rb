class AddPitchNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :pitch_name, :string
  end
end
