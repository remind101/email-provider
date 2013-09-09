module EmailProvider
  class Configuration
    attr_accessor :cache

    def cache
      @cache ||= defined?(::Rails) ? Rails.cache : nil
    end
  end
end
