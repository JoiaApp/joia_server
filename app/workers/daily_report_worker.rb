class DailyReportWorker
  include Sidekiq::Worker
  def perform()
    Group.all.each do |group|
      user_ids = group.users.collect { |user| user.id }
      group.users.each do |user|
        responses = Response.where("DATE(created_at) = ? AND group_id = ? AND user_id IN (?)", Date.today, group.id, user_ids - [user.id])
        mentions = Mention.where("DATE(created_at) = ? AND user_id = ?", Date.today, user.id)
        DailyReportMailer.daily_report_email(group, user.email, responses, mentions).deliver
      end
    end
  end
end
