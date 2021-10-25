# frozen_string_literal: true

require './lib/log_file_parser'

RSpec.describe LogFileParser do
  let(:file_path) { './spec/fixtures/test_webserver.log' }
  subject { described_class.new(file_path) }

  describe '#parsing' do
    before { subject.parse_file }
    let(:expected_results) do
      { '/about/2' => ['444.701.448.104', '836.973.694.403', '184.123.665.067', '382.335.626.855'],
        '/contact' => ['543.910.244.929', '555.576.836.194', '200.017.277.774', '316.433.849.805', '836.973.694.403'],
        '/about' => ['126.318.035.038', '235.313.352.950', '836.973.694.403', '929.398.951.889'],
        '/index' => ['316.433.849.805', '802.683.925.780', '929.398.951.889'],
        '/help_page/1' => ['929.398.951.889', '929.398.951.889', '836.973.694.403'],
        '/home' => ['444.701.448.104', '336.284.013.698', '444.701.448.104'] }
    end
    it 'log file is parsed successfully' do
      expect(subject.parse_file).to eq(expected_results)
    end
  end
end
