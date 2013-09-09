module EmailProvider
  # Internal: Responsible for taking a full domain and returning the
  # domain along with the TLD.
  #
  # http://rubular.com/r/3UJycUykAd
  class DomainParser
    REGEX = /^(?:(?>[a-z0-9-]*\.)+?|)([a-z0-9-]+\.(?>[a-z]*(?>\.[a-z]{2})?))$/i

    attr_reader :domain

    def self.parse(*args)
      new(*args).parse
    end

    def initialize(domain)
      @domain = domain.to_s
    end

    def parse
      domain.gsub(REGEX, '\1').strip
    end
  end
end
