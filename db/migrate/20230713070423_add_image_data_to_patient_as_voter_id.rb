class AddImageDataToPatientAsVoterId < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :voter_id, :json
  end
end
