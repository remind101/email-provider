require 'resolv'
require 'mail'

module EmailProvider
  autoload :Lookup, 'email_provider/lookup'
  autoload :DomainParser, 'email_provider/domain_parser'
  autoload :Normalizer, 'email_provider/normalizer'

  # Public: Returns the email provider for the given email.
  #
  # email - A String email address to lookup.
  #
  # Returns the Symbol name of the provider.
  def self.find(email)
  end
end
