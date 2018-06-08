class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    if @user.type == "doctor" || @user.type == "pharmacist"
    @patients_requested = RequestAccess.where(requestor_id: @user._id)
    @patients_not_requested = User.where(:type => "patient", :_id.nin => @patients_requested.pluck(:grantor_id))

    elsif @user.type == "patient"
      @requestors = RequestAccess.where(grantor_id: @user._id, :status => "pending")
      @doctors = User.where(:type => "doctor", :_id.in => @requestors.pluck(:requestor_id))
      @pharmacists = User.where(:type => "pharmacist", :_id.in => @requestors.pluck(:requestor_id))
    end
  end

  def create_request
    @request_access = RequestAccess.create(requestor_id: params[:id], grantor_id: params[:patient_id])
    @user = User.find(params[:id])
    redirect_to @user
  end

  def approve_request
    @request_access = RequestAccess.where(grantor_id: params[:id], requestor_id: params[:requestor_id]).first
    @request_access.status = "approved"
    @request_access.save!
    @user = User.find(params[:id])
    redirect_to @user
  end

  def deny_request
    @request_access = RequestAccess.where(grantor_id: params[:id], requestor_id: params[:requestor_id]).first
    @request_access.status = "denied"
    @request_access.save!
    @user = User.find(params[:id])
    redirect_to @user
  end

  def view_document
    @user = User.find(params[:id])
    @documents = User.where(id: params[:patient_id]).first.documents
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :type, :password)
    end
end
