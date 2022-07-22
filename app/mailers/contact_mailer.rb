class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: '[お問合わせ]' + @contact.subject_i18n
  end
end
