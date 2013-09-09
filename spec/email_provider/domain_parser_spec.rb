require 'spec_helper'

describe EmailProvider::DomainParser do
  describe '#parse' do
    [
      ['foo.com',             'foo.com'],
      ['www.foo.com',         'foo.com'],
      ['bar.foo.com',         'foo.com'],
      ['www.foo.ca',          'foo.ca'],
      ['www.foo.co.uk',       'foo.co.uk'],
      ['a.b.c.d.e.foo.com',   'foo.com'],
      ['a.b.c.d.e.foo.co.uk', 'foo.co.uk']
    ].each do |(domain, expected)|
      context "when the domain is #{domain}" do
        subject { described_class.new(domain).parse }
        it { should eq expected }
      end
    end
  end
end
