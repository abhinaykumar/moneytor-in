module DbServices
  class Portfolio < ActiveRecord::Migration[6.0]
    def self.add_sum_of_investment_column(table_name, column_name, column_type)
      add_column table_name.to_sym, column_name.to_sym, column_type.to_sym
    end

    def self.remove_sum_of_investment_column(table_name, column_name)
      remove_column table_name.to_sym, column_name.to_sym
    end
  end
end
