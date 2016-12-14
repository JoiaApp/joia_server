class DailyReportMailer < ActionMailer::Base
  def daily_report_email(email, group, responses, mentions)
    @date = Date.today.to_s(:long_ordinal)
    @group = group
    @responses = responses
    @mentions = mentions
    subject = "Joia report for #{@date}"
    mail(from: "joiaapp@gmail.com", to: email, subject: subject).deliver
  end
end
