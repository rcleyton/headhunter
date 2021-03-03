class Job < ApplicationRecord
  validates :title, :detailed_description, :desired_skills, 
            :salary_range, :limit_date, :job_location, presence: true
  before_create :generate_code
  
  private
  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
