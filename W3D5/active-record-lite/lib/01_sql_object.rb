require_relative 'db_connection'
require_relative '00_attr_accessor_object'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    @columns = data.first.map { |el| el.to_sym }

  end

  def self.finalize!
    # @columns.each do |columns|
    self.columns.each do |column|
        define_method(column) do 
          self.attributes[column]
        end

        define_method("#{column}=") do |value|
          self.attributes[column] = value
        end
    end
    @attributes
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.name.tableize
  end

  def self.all
    # ...
    return @table if @table
    data = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    p @table = data.map { |el| el.to_sym }
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
