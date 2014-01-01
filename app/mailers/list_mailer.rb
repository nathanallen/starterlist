class ListMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.list_mailer.creation_confirmation_email.subject
  #
  def creation_confirmation_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.list_mailer.subscription_confirmation_email.subject
  #
  def subscription_confirmation_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.list_mailer.email_blast.subject
  #
  def email_blast
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
