# frozen_string_literal: true

require 'ostruct'
# Query Builder Interface
class BaseQueryBuilder
  class << self
    def query(data)
      new(data).query
    end
  end

  def initialize(data)
    @data = data.values
  end

  def query
    raise NotImplementedError
  end

  private

  attr_reader :data

  def struct_from(kwargs)
    OpenStruct.new(**kwargs)
  end
end
