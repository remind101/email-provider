module EmailProvider
  class Normalizer
    attr_reader :provider

    MAPPINGS = YAML.load File.read(File.expand_path('../../../data/mappings.yml', __FILE__))

    def self.normalize(*args)
      new(*args).normalize
    end

    def initialize(provider)
      @provider = provider
    end

    def normalize
      MAPPINGS[provider]
    end
  end
end
