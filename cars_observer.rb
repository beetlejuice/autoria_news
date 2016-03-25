require_relative 'mailer'

class CarsObserver
  class << self

    def check_updates(cars)
      last_id = fetch_last_id
      current_id = fetch_current_id(cars)
      store_current_id(current_id)

      Mailer.notify if current_id > last_id
    end

    private

    def fetch_last_id
      File.read(id_store_file).to_i
    end

    def fetch_current_id(cars)
      cars.last
    end

    def store_current_id(id)
      File.write(id_store_file, id)
    end

    def id_store_file
      File.write(id_store_path, '0') unless File.exist? id_store_path
      id_store_path
    end

    def id_store_path
      'id_store'
    end
  end
end