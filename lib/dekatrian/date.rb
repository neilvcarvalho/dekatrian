# frozen_string_literal: true

module Dekatrian
  class Date
    attr_reader :year, :month, :day

    def initialize(year = 1, month = 1, day = 1)
      self.year = year
      self.month = month
      self.day = day
    end

    private

    attr_writer :year, :day

    def month=(value)
      raise ArgumentError, "invalid month" if value < 1 || value > 13

      @month = value
    end

    def day=(value)
      raise ArgumentError, "invalid day" if value < 1 || value > 28

      @day = value
    end
  end
end
