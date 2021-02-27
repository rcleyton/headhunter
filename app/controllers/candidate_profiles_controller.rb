class CandidateProfilesController < ApplicationController

  def show
    @candidate_profile = CandidateProfile.find(params[:id])
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

end