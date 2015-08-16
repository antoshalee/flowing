require 'spec_helper'

describe Flowing do
  it 'has a version number' do
    expect(Flowing::VERSION).not_to be nil
  end

  describe ".explain" do
    class Flowing::Actions::Populate < Flowing::Actions::Base
      desc "Populates context with needed data"

      context_reader :config
      context_reader :time_range, :status

      def call
        "I am populating"
      end
    end

    class Flowing::Actions::NoReaders < Flowing::Actions::Base
      desc "Does not read"

      def call
      end
    end

    it 'explains what action is doing' do
      expect(Flowing.explain(:populate)).to eq(
        "Populates context with needed data. It reads config, time_range, status"
      )

      expect(Flowing.explain(:no_readers)).to eq("Does not read")
    end
  end
end
