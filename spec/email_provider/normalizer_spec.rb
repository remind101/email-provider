require 'spec_helper'

describe EmailProvider::Normalizer do
  subject(:normalizer) { described_class.new provider }

  describe '#normalize' do
    subject { normalizer.normalize }

    [
      [:googlemail, :gmail]
    ].each do |(input, output)|
      context "when the input is #{input}" do
        let(:provider) { input }
        it { should eq output }
      end
    end
  end
end
