require 'spec_helper'

describe EmailProvider::Lookup::Regex do
  describe '#lookup' do
    it 'should delegate to DomainParser' do
      EmailProvider::DomainParser.should_receive(:parse).with('foo.com')
      described_class.new('eric@foo.com').lookup
    end
  end
end
