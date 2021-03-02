class Job < ApplicationRecord

  before_create :generate_code
  
  private
  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
