require 'spec_helper'

describe EmailProvider do
  describe '.find' do
    it do
      described_class.find('eric@ejholmes.net')
    end
  end
end
