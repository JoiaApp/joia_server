require 'mandrill'

module Joia

RESET_HEADER = <<HEREDOC
<p>Hi *|FNAME|*,&nbsp;we received a request to reset your Joia password.</p>
<p>Enter the following&nbsp;<strong>Temporary Password</strong>&nbsp;inside the Joia app:</p>
HEREDOC

RESET_LINK = <<HEREDOC
<a class="mcnButton " title="*|PASSWORD_RESET_CODE|*" href="joiaapp://reset" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #273444;">*|PASSWORD_RESET_CODE|*</a>
HEREDOC

INVITE_HEADER = <<HEREDOC
<p style="text-align: center;">Your friend, *|INVITER_NAME|*,&nbsp;has invited you to join their Joia group <strong>*|GROUP_NAME|*</strong>.</p>
HEREDOC

INVITE_BODY = <<HEREDOC
<div mc:edit="invite">
<p style="font-size: 16px;">Hey everybody,<br>
I found this app Joia that helps groups share positive moments together. I thought it would be cool for everybody from school to join so we can stay in touch.</p>
<p style="font-size: 16px;"><span style="font-size:14px"><span style="color:#9EB0C4">*|INVITER_NAME|*</span></span></p>
</div>
HEREDOC

  class ResetPasswordEmail
    def initialize(email, user_name, new_password)
      @email = email
      @user_name = user_name
      @new_password = new_password
    end

    def send
      mandrill = Mandrill::API.new 'i1Eu_yKetF6po1Cm9UhhSw'
      template_name = "reset-password"
      template_content = []
      message = {
        "subject" => "Your Joia password has been changed",
        "from_email" => "noreply@joiaapp.com",
        "to" => 
            [{"type" => "to", "email" => @email, "name" => @email}],
        "merge_vars" =>
            [{"vars" => [{"content" => @user_name, "name" => "FNAME"}, {"content" => @new_password, "name" => "PASSWORD_RESET_CODE"}],
                "rcpt" => @email}]
      }
      async = true
      ip_pool = ""
      send_at = Time.now.to_s
      result = mandrill.messages.send_template template_name, template_content, message, async, ip_pool, send_at
    end
  end

  class InviteEmail
    def initialize(email, group, user)
      @group = group
      @email = email
      @user = user
    end

    def send
      mandrill = Mandrill::API.new 'i1Eu_yKetF6po1Cm9UhhSw'
      template_name = "group-invite"
      template_content = [
        {"name" => "header", "content"=>INVITE_HEADER},
        {"name" => "invite", "content"=>INVITE_BODY}
      ]
      # TODO: Add group code
      message = {
        "subject" => "You've been invited to Joia!",
        "from_email" => "noreply@joiaapp.com",
        "to" => 
            [{"type" => "to", "email" => @email, "name" => @email}],
        "merge_vars" =>
            [{"vars" => [{"content" => @user.name, "name" => "INVITER_NAME"}, {"content" => "Joia Devs", "name" => "GROUP_NAME"}],
                "rcpt" => @email}]
      }
      async = true
      ip_pool = ""
      send_at = Time.now.to_s
      result = mandrill.messages.send_template template_name, template_content, message, async, ip_pool, send_at
    end
  end
end
