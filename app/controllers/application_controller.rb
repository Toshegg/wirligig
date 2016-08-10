class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session

  respond_to :json

  private

  def admin_user? 
    current_user && current_user.is_admin?
  end

  def partner_user?
    current_user && current_user.is_partner?
  end

  def paid_user?
    current_user && current_user.is_paid?
  end

  def check_if_admin_or_partner
    head 403 unless admin_user? || partner_user?
  end

  def check_if_admin
    head 403 unless admin_user?
  end

  def check_if_paid
    head 403 unless (paid_user? || partner_user? || admin_user?)
  end

end
