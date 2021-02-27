class AddReferencesToCandidateProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidate_profiles, :user, foreign_key: true
  end
end
