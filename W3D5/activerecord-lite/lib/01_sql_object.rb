require 'byebug'

require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns

    cols = DBConnection.execute2(<<-SQL).first
      SELECT *
      FROM #{table_name}
    SQL

    @columns = cols.map!(&:to_sym)
  end

  def self.finalize!

    # Must use self.columns
    self.columns.each do |column_name|
      define_method(column_name) do
        self.attributes[column_name]
      end

      # Must use self.attributes
      define_method("#{column_name}=") do |value|
        self.attributes[column_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  # Table name is assigned OR class.name.downcase's'
  def self.table_name
    @table_name ||= "#{name.downcase}s"
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT #{table_name}.*
      FROM #{table_name}
    SQL

    parse_all(results)

  end

  def self.parse_all(results)
    # Results is an array of many "self" objects & attributes (hashed)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
    # self.all.find {|obj| obj.id == id}
    results = DBConnection.execute(<<-SQL, id)
      SELECT #{table_name}.*
      FROM #{table_name}
      WHERE #{table_name}.id = ?
    SQL

    parse_all(results).first
  end

  def initialize(params = {})

    # Columns is a class method! Must use self.class.columns.
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", val)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values

    # Originally written as self.attributes.values, need to
    # map attributes so everything is ordered

    self.class.columns.map {|attr| self.send(attr)}
  end

  def insert
    # ...
    cols = self.class.columns
    col_names = cols.map(&:to_s).join(", ")
    question_marks = (["?"] * cols.count).join(", ")


    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set_line = self.class.columns.map { |attr| "#{attr} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL

  end

  def save
    # ...
    id.nil? ? insert : update
  end
end
