module EmailProvider
  module Lookup
    class Mx < Base
      attr_reader :email

      def initialize(email)
        @email = email
      end

      def lookup
        DomainParser.parse(mail_exchanges.first)
      end

    private

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
