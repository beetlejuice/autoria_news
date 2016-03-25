class CarsSearcher

  def initialize(cars)
    @cars = cars
  end

  def select_cars_by_price_range(price_from, price_to)
    classifieds = @cars["classifieds"]
    prices = @cars["prices"]
    zipped_cars = classifieds.zip(prices)

    zipped_cars
      .reject { |car| car[1].between?(price_from, price_to) }
      .map(&:first)
      .sort
  end
end