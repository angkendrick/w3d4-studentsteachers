require_relative 'spec_helper'

describe 'create table with correct schema' do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it 'should have a Teachers table' do
    expect(ActiveRecord::Base.connection.table_exists?(:teachers)).to eq(true)
  end

  it 'should have the right columns and types' do
    expected = {
      id: :integer,
      name: :string,
      email: :string,
      address: :string,
      phone: :string,
      created_at: :datetime,
      updated_at: :datetime
    }
    actual_columns = ActiveRecord::Base.connection.columns(:teachers)
    expected.each do |column_name, data_type|
      column = actual_columns.detect { |c| c.name == column_name.to_s && c.type == data_type }
      error = "Expected column '#{column_name}' of type :#{data_type} to be in the table, but it wasn't there!"
      expect(column).to_not be_nil, error
    end
  end
end