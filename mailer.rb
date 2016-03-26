require 'mail'
require 'yaml'

class Mailer

  def self.notify
    mail_config = YAML::load_file('config/mail_config.yml')
    mailer_account = mail_config['mailer_account']
    mailer_password = mail_config['mailer_password']
    options = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :domain               => 'gmail.com',
        :user_name            => mailer_account,
        :password             => mailer_password,
        :authentication       => 'plain',
        :enable_starttls_auto => true
    }

    Mail.defaults do
      delivery_method :smtp, options
    end

    recipient_address = mail_config['recipient_account']

    Mail.deliver do
      from         mailer_account
      to           recipient_address
      subject      'Good news everyone!'
      body         'Hi! Check auto.ria!'
      content_type 'text/html; charset=UTF-8'
    end
  end
end