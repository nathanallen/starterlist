class ListMailer < ActionMailer::Base
  
  def creation_confirmation_email(list)
    @list = list
    mail( to: list.owner.email,
          from: list.custom_email, 
          subject: 'Get started with your new list!'
    )
  end

  def subscription_confirmation_email(subscription)
    @list = subscription.list
    mail( to: subscription.user.email,
          from: @list.custom_email, 
          subject: 'Spread the word!'
    )
  end

  def email_blast(list)
    @list = list
    mail( to: list.emails,
          from: list.custom_email, 
          subject: 'Your email list is ready'
    )      
  end

end
