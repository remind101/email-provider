require 'resolv'

module EmailProvider
  PROVIDERS = %w[unkown google hotmail aol yahoo].map(&:to_sym)

  autoload :Lookup, 'email_provider/lookup'

  # Public: Returns the email provider for the given email.
  #
  # email - A String email address to lookup.
  #
  # Returns the Symbol name of the provider.
  def self.find(email)
    Lookup.new(email).lookup
  end
end
