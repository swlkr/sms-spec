class Message
  attr_accessor :number
  attr_accessor :body
  attr_accessor :sid
  attr_accessor :to
  attr_accessor :from
  attr_accessor :date_sent
  attr_accessor :status

  include SmsSpec::Util

  def initialize(opts={})
    @number = sanitize opts[:number]
    @body = opts[:body]
    @sid = opts[:sid] || "SM#{SecureRandom.uuid.gsub(/-/, '')}"
    @to = opts[:to]
    @from = opts[:from]
    @date_sent = opts[:date_sent] || Time.now
    @status = opts[:status] || 'Queued'
  end
end
