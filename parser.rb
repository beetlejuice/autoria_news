require_relative 'autoria_client'
require 'json'
require 'yaml'

class Parser

  attr_reader :client

  def get_cars(parameters)
    response = client.get_ads(parameters).perform
    response.success? ? JSON.parse(response.body) : {}
  end

  private

  def client
    @client ||= AutoRiaClient.new
  end
end