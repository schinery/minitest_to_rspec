require "spec_helper"

module MinitestToRspec
  RSpec.describe Converter do

    EXAMPLES = %w[
      01_trivial_assertion
      02_empty_testcase
      03_trivial_refutation
      04_assert_equal
    ]

    def convert(input)
      described_class.new.convert(input)
    end

    def input(fixture)
      File.read(fixture_path(fixture, "in.rb"))
    end

    def fixture_path(fixture, file)
      File.join(__dir__, '..', 'fixtures', fixture, file)
    end

    def output(fixture)
      File.read(fixture_path(fixture, "out.rb"))
    end

    describe "#convert" do
      EXAMPLES.each do |fixture|
        it "converts: #{fixture}" do
          expected = output(fixture).strip
          calculated = convert(input(fixture)).strip
          expect(calculated).to eq(expected)
        end
      end
    end
  end
end
