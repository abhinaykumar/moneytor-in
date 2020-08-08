module HomeHelper
  def set_table_properties(indx)
    return ['', false, ''] unless indx.zero?

    ['active', true, 'show']
  end
end