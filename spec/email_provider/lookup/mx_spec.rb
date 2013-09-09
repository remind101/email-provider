require 'spec_helper'

describe EmailProvider::Lookup::Mx do
  subject(:lookup) { described_class.new(email) }

  describe '#lookup' do
    let(:dns) { double(Resolv::DNS, getresources: nil) }
    let(:email) { 'foo@gmail.com' }

    before do
      lookup.stub dns: dns
    end

    it 'performs a dns lookup' do
      dns.should_receive(:getresources)
        .with('gmail.com', Resolv::DNS::Resource::IN::MX)
        .and_return([double('Record', exchange: 'google.com')])
      expect(lookup.lookup).to eq 'google.com'
    end
  end
end
