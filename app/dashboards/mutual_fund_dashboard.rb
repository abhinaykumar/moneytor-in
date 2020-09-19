require "administrate/base_dashboard"

class MutualFundDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    portfolio: Field::BelongsTo,
    listed_mutual_fund: Field::BelongsTo,
    id: Field::Number,
    date_of_investment: Field::Date,
    units: Field::Number.with_options(decimals: 2),
    investment_amount: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    at_nav: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  portfolio
  listed_mutual_fund
  id
  date_of_investment
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  portfolio
  listed_mutual_fund
  id
  date_of_investment
  units
  investment_amount
  created_at
  updated_at
  name
  at_nav
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  portfolio
  listed_mutual_fund
  date_of_investment
  units
  investment_amount
  name
  at_nav
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how mutual funds are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(mutual_fund)
  #   "MutualFund ##{mutual_fund.id}"
  # end
end
