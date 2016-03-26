require_relative 'parser'
require_relative 'cars_searcher'
require_relative 'cars_observer'

parameters = YAML.load(File.open('config/car_parameters.yml'))

cars_parser = Parser.new
cars = cars_parser.get_cars(parameters["api"])
cars_searcher = CarsSearcher.new(cars)
priced_cars = cars_searcher.select_cars_by_price_range(*parameters["price"].values)

CarsObserver.check_updates(priced_cars)