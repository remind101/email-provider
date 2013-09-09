module EmailProvider::Lookup
  class Base
    attr_reader :email

    def initialize(email)
      @email
    end

    def self.lookup(*args)
      new(*args).lookup
    end

    def lookup
      raise NotImplemented
    end

  private

    # Internal: The domain name for this email address.
    def domain
      @domain ||= Mail::Address.new(email).domain
    end
  end
end
