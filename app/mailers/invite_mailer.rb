class InviteMailer < ActionMailer::Base
  default from: "noreply@joiaapp.com"
  def invite_email(email, group, user)
    @user = user
    @group = group
    @url  = 'http://joiaapp.com/login'
    mail(to: email, subject: 'Somebody invited you to join Joia App!')
  end
end
