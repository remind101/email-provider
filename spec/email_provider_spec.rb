require 'spec_helper'

describe EmailProvider do
  describe '.find' do
    it 'delegates to Finder.find' do
      EmailProvider::Finder.should_receive(:find).with('eric@remind101.com')
      described_class.find('eric@remind101.com')
    end
  end
end
