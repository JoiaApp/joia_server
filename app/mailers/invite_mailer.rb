class InviteMailer < ActionMailer::Base
  def invite_email(email, group, user)
    @user = user
    @group = group
    @url  = "joiaapp://login?group=#{@group.guid}&code=#{@group.password}"
    @google_play_store_url = "<Google Play Store Joia URL>"
    @app_store_url = "<iOS App Store URL>"
    mail(from: "joiaapp@gmail.com", to: email, subject: 'Somebody invited you to join Joia App!')
  end
end
