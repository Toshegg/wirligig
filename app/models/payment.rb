class Payment < ActiveRecord::Base
  belongs_to :user

  def self.paypal_url(_user)
    values = {
        business: "merchant@wrlgig.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}/api/payment_succeed",
        invoice: _user.uuid,
        amount: 100,
        item_name: 'Access to universities information',
        item_number: 1,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/api/payment_succeed"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
