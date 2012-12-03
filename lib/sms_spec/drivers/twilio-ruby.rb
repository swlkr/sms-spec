class Twilio::REST::Client

  def initialize(account_sid, auth_token)
    $account_sid = account_sid
  end

  class Messages
    include SmsSpec::Helpers

    def create(opts={})
      to = opts[:to]
      from = opts[:from]
      body = opts[:body]
      sid = "SM#{SecureRandom.uuid.gsub(/-/, '')}"
      date_sent = Time.now.strftime('%H:%M:%S %Z %Y-%m-%d')
      status = 'Sent'
      add_message Message.new(:number => to, :to => opts[:to], :body => body, :sid => sid, :from => from, :date_sent => date_sent, :status => status)
    end
  end

  class Sms
    def messages
      return Messages.new
    end
  end

  class Account
    def sms
      return Sms.new
    end
  end

  def account
    account = Account.new
    account.class.send(:define_method, :sid, lambda { $account_sid })
    account
  end
end
