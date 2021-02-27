class User < ApplicationRecord
  has_one :candidate_profile
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { candidate: 0, headhunter: 10 }
  after_initialize :set_default_role, :if => :new_record?
       
  def set_default_role
    self.role ||= :candidate
  end

end
