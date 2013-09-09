module EmailProvider
  module Lookup
    class Regex < Base

      attr_reader :email

      def initialize(email)
        @email = email
      end

      def lookup
        DomainParser.parse(domain)
      end
    end
  end
end
