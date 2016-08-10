class Api::PaymentsController < ApplicationController
  protect_from_forgery except: [:payment_succeed]

  def pay
    redirect_to Payment.paypal_url(User.find_by(uuid: params[:user_uuid]))
  end

  def payment_succeed
    permitted_params = params.permit!.symbolize_keys
    status = permitted_params[:payment_status]

    if status == "Completed"
      @user = User.find_by uuid: permitted_params[:invoice]
      @user.update(is_paid: true)

      Payment.create notification_params: permitted_params, status: status, transaction_id: permitted_params[:txn_id], purchased_at: Time.now, user: @user
    end

    redirect_to Rails.application.secrets.app_host
  end

end
