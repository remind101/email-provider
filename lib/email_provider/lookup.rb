module EmailProvider
  module Lookup
    autoload :Base,  'email_provider/lookup/base'
    autoload :Mx,    'email_provider/lookup/mx'
    autoload :Regex, 'email_provider/lookup/regex'
  end
end
