module EmailProvider
  class Lookup
    attr_reader :email

    def initialize(email)
      @email = email
    end

    def lookup
      # TODO
    end

  private

    # Internal: Returns the MX records for the email address.
    def records
      Resolv::DNS.open do |dns|
        dns.getresources domain, Resolv::DNS::Resource::IN::MX
      end
    end

    # Internal: Stringify's the mail exchange records.
    def mail_exchanges
      record.map { |record| record.exchange.to_s }
    end

    # Internal: The domain name for this email address.
    def domain
      @domain ||= Mail::Address.new(email).domain
    end
  end
end
