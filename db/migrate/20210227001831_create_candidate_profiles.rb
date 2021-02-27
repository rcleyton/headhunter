class CreateCandidateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_profiles do |t|
      t.string :first_name
      t.string :lastname
      t.string :about_me
      t.date :birthdate
      t.string :degree
      t.string :experience

      t.timestamps
    end
  end
end
