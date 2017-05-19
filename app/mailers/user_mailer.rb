class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify.subject
  #
  def low_stock_info
    @low_stock_info = "Hi, your stock is running low. Remember to buy some #{}"

    mail to: "to@example.org"
  end


  def products_expiring
    @expiring_product = "Hi, remember to use these products shortly!"
  end
end
