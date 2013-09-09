module EmailProvider
  class Finder
    attr_reader :email

    def self.find(*args)
      new(*args).find
    end

    def initialize(email)
      @email = email
    end

    def find
      if from_regex?
        from_regex
      elsif from_mx?
        from_mx
      end
    end

  private

    def from_regex
      @from_regex ||= Provider.new(Lookup::Regex.lookup(email))
    end

    def from_mx
      @from_mx ||= Provider.new(Lookup::Mx.lookup(email))
    end

    def from_regex?
      from_regex.to_sym
    end

    def from_mx?
      from_mx.to_sym
    end
  
  end
end
