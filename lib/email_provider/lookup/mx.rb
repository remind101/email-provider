module EmailProvider
  module Lookup
    class Mx < Base
      SUPPORTED_PROVIDERS = /google|outlook|hotmail|aol|yahoo/

      attr_reader :email

      def initialize(email)
        @email = email
      end

      def lookup
        DomainParser.parse(supported_mail_exchange)
      end

    private

      def supported_mail_exchange
        mail_exchanges.each do |mx|
          mx = mx.downcase
          return mx if mx[SUPPORTED_PROVIDERS]
        end
      end

      # Internal: Stringify's the mail exchange records.
      def mail_exchanges
        records.map { |record| record.exchange.to_s }
      end

      # Internal: Returns the MX records for the email address.
      def records
        dns.getresources domain, Resolv::DNS::Resource::IN::MX
      end

      # Internal: Returns an open Resolv::DNS connection.
      def dns
        @dns ||= Resolv::DNS.open
      end
    end
  end
end
