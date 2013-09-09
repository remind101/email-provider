require 'spec_helper'

describe EmailProvider::Normalizer do
  MAPPINGS = YAML.load File.read(File.expand_path('../../../data/mappings.yml', __FILE__))

  subject(:normalizer) { described_class.new provider }

  describe '#normalize' do
    let(:mappings) { YAML.load File.read(File.expand_path('../../../data/mappings.yml', __FILE__)) }
    subject { normalizer.normalize }

    MAPPINGS.each do |input, output|
      context "when the input is #{input}" do
        let(:provider) { input }
        it { should eq output }
      end
    end
  end
end
