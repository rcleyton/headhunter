class AddCodeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :code, :string
  end
end
