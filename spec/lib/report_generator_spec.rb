# frozen_string_literal: true

require './lib/log_file_parser'
require './lib/report_generator'

RSpec.describe ReportGenerator do
  let(:file_path) { './spec/fixtures/test_webserver.log' }
  let(:logs) { LogFileParser.new(file_path).parse_file }

  subject { ReportGenerator.new(logs) }

  describe '#sorted_logs' do
    let(:expected_results) do
      { '/contact' => ['543.910.244.929', '555.576.836.194', '200.017.277.774', '316.433.849.805', '836.973.694.403'],
        '/about' => ['126.318.035.038', '235.313.352.950', '836.973.694.403', '929.398.951.889'],
        '/about/2' => ['444.701.448.104', '836.973.694.403', '184.123.665.067', '382.335.626.855'],
        '/home' => ['444.701.448.104', '336.284.013.698', '444.701.448.104'],
        '/help_page/1' => ['929.398.951.889', '929.398.951.889', '836.973.694.403'],
        '/index' => ['316.433.849.805', '802.683.925.780', '929.398.951.889'] }
    end

    it 'returns the correct values for sorted_logs' do
      expect(subject.instance_eval('sorted_logs', __FILE__, __LINE__)).to eq(expected_results)
    end
  end

  describe '#most_views' do
    before { subject.instance_eval('sorted_logs', __FILE__, __LINE__) }

    let(:expected_results) do
      { '/contact' => 5, '/about' => 4, '/about/2' => 4, '/home' => 3, '/help_page/1' => 3, '/index' => 3 }
    end

    let(:unexpected_results) do
      { '/contact' => 4, '/about' => 9, '/about/2' => 0, '/home' => 7, '/help_page/1' => 0, '/index' => 1 }
    end

    it 'returns the most visits' do
      expect(subject.most_views).eql?(expected_results)
    end

    it 'returns the most visits when logs are different' do
      expect(subject.most_views).eql?(unexpected_results)
    end
  end

  describe '#unique_views' do
    before { subject.instance_eval('sorted_logs', __FILE__, __LINE__) }

    let(:expected_results) do
      { '/contact' => 5, '/about/2' => 4, '/about' => 4, '/index' => 3, '/help_page/1' => 2, '/home' => 2 }
    end

    let(:unexpected_results) do
      { '/contact' => 4, '/about' => 9, '/about/2' => 0, '/home' => 7, '/help_page/1' => 0, '/index' => 1 }
    end

    it 'returns the uniq visits' do
      expect(subject.uniq_views).eql?(expected_results)
    end

    it 'returns the uniq visits when logs are different' do
      expect(subject.most_views).eql?(unexpected_results)
    end
  end
end
