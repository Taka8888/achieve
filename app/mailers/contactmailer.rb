class Contactmailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contactmailer.sendmail_contact.subject
  #
  def sendmail_contact(contact)
    @contact = contact

    mail to: "puravida590@gmail.com",
         subject:'【Achieve】お問い合わせありがありました。'
  end
end
