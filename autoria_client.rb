require 'weary'

class AutoRiaClient < Weary::Client
  domain 'http://api.auto.ria.com'

  get :get_ads, "/average" do |resource|
    resource.optional :main_category, :marka_id, :model_id, :yers
  end
end