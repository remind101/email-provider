module EmailProvider
  class Normalizer
    attr_reader :provider

    RULES = {
      :googlemail => :gmail,
      :ymail      => :yahoo,
      :rocketmail => :yahoo,
      :sbcglobal  => :yahoo,
      :live       => :hotmail,
      :msn        => :hotmail,
      :outlook    => :hotmail
    }

    def initialize(provider)
      @provider = provider
    end

    def normalize
      RULES[provider] || provider
    end
  end
end
