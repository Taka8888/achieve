# Preview all emails at http://localhost:3000/rails/mailers/contactmailer
class ContactmailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contactmailer/sendmail_contact
  def sendmail_contact
    Contactmailer.sendmail_contact
  end

end
