require 'spec_helper'

describe CmdRunner::Command do
  subject { described_class.new(command) }

  before do
    subject.logger = Logger.new('/dev/null')
  end

  context 'successfully' do
    let(:command) { 'ls' }

    it 'runns' do
      results = subject.execute!
      expect(results[0]).to eq(0)
      expect(results[1]).to_not be_empty
      expect(results[2]).to be_empty
    end

    context 'in a work dir' do
      it 'cd to work dir before it runns' do
        subject.work_dir = 'foo'
        expect(subject.cmd).to match /^cd foo && /
      end
    end
  end

  context 'unsuccessfully' do
    let(:command) { 'exit 1' }

    it 'runns' do
      expect { subject.execute! }.to raise_error("Command exited with non zero status: exit 1")
    end
  end
end
