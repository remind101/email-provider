module EmailProvider
  class Provider
    attr_reader :domain

    def initialize(domain)
      @domain = domain
    end

    # Public: The "name" of the provider.
    # 
    # Examples
    #
    #   Provider.new("google.com").name
    #   # => "google"
    #   
    #   Provider.new("googlemail.com").name
    #   # => "googlemail
    def name
      domain.split('.').first
    end

    def to_sym
      Normalizer.normalize(name.to_sym)
    end
  end
end
