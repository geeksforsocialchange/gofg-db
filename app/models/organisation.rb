class Organisation < ApplicationRecord

  enum activity: {
    "Boxing": 0,
    "Football": 1,
    "Theatre": 2,
    "Dance": 3
  }

  def address
    "#{address_1}, #{address_2}, #{city}, #{postcode}"
  end
end
