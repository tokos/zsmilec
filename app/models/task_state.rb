#!/bin/env ruby
# encoding: utf-8
module Task_state

  def self.find_by_id id
    if id.instance_of? String
      id = id.to_i
    end 
    values.each do |type|
      if id == type.id
        return type
      end
    end
    nil
  end

  def self.values
    [@CREATED, @ASSIGNED, @CONSIGNED, @CHECKED] 
  end

  class Enum
    attr_reader :id, :label

    def initialize id, label
      @id = id
      @label = label
    end
  end

  @CREATED = Enum.new(0, "vytvořený")
  @ASSIGNED = Enum.new(1, "přiřazený")
  @CONSIGNED = Enum.new(2, "odevzdaný")
  @CHECKED = Enum.new(3, "opravený")

end
