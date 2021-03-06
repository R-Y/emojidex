# encoding: utf-8

module Emojidex
  # Category information
  class Category
    attr_accessor :code, :en, :ja

    def initialize(details = {})
      @code = details[:code]
      @en = details[:en]
      @ja = details[:ja]
    end
  end
end
