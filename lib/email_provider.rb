require 'resolv'
require 'mail'

module EmailProvider
  autoload :Lookup, 'email_provider/lookup'
  autoload :DomainParser, 'email_provider/domain_parser'
  autoload :Normalizer, 'email_provider/normalizer'
  autoload :Provider, 'email_provider/provider'
  autoload :Finder, 'email_provider/finder'

  # Public: Returns the email provider for the given email.
  #
  # email - A String email address to lookup.
  #
  # Returns an EmailProvider::Provider.
  def self.find(email)
    Finder.find(email)
  end
end
