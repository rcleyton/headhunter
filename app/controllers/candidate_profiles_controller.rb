class CandidateProfilesController < ApplicationController
  before_action :authorize_candidate!, except: [:show]

  def show
    @candidate_profile = CandidateProfile.find(params[:id])
    if current_user.candidate_profile != @candidate_profile 
      redirect_to root_path
    end
  end

  def new
    @candidate_profile = CandidateProfile.new
  end

  def create
    @candidate_profile = CandidateProfile.new(candidate_profile_params)
    if @candidate_profile.save
      redirect_to @candidate_profile
    else  
      render :new
    end
  end

  private

  def candidate_profile_params
    params.require(:candidate_profile).permit(:first_name, :lastname, :about_me,
                                              :birthdate, :degree, :experience,
                                              :photo, :user_id)
  end

  def authorize_candidate!
    return if current_user.candidate?
    redirect_to root_path
  end
end