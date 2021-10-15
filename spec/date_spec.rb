# frozen_string_literal: true

require "spec_helper"
require "dekatrian/date"

RSpec.describe Dekatrian::Date do
  describe "#new" do
    context "when no argument is passed" do
      it "creates a Date on the first day of year 1" do
        date = described_class.new

        expect(date.year).to eq 1
        expect(date.month).to eq 1
        expect(date.day).to eq 1
      end
    end

    context "when only the year is passed" do
      it "creates a Date on the first day of the given year" do
        date = described_class.new(2000)

        expect(date.year).to eq 2000
        expect(date.month).to eq 1
        expect(date.day).to eq 1
      end
    end
    context "when only the year and month are passed" do
      it "creates a Date on the first day of the given year and month" do
        date = described_class.new(2000, 10)

        expect(date.year).to eq 2000
        expect(date.month).to eq 10
        expect(date.day).to eq 1
      end
    end

    context "when the month is over 13" do
      it "raises an ArgumentError" do
        expect { described_class.new(2000, 14) }.to raise_error(ArgumentError, "invalid month")
      end
    end

    context "when the month is below 1" do
      it "raises an ArgumentError" do
        expect { described_class.new(2000, 0) }.to raise_error(ArgumentError, "invalid month")
      end
    end

    context "when the day is over 28" do
      it "raises an ArgumentError" do
        expect { described_class.new(2000, 1, 29) }.to raise_error(ArgumentError, "invalid day")
      end
    end

    context "when the day is below 1" do
      it "raises an ArgumentError" do
        expect { described_class.new(2000, 1, 0) }.to raise_error(ArgumentError, "invalid day")
      end
    end
  end
end
