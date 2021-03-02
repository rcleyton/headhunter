class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :detailed_description
      t.string :desired_skills
      t.decimal :salary_range
      t.string :vacancy_level
      t.date :limit_date
      t.string :job_location

      t.timestamps
    end
  end
end
