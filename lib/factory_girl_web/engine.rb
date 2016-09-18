module FactoryGirlWeb
  class Engine < ::Rails::Engine
    isolate_namespace FactoryGirlWeb

    config.generators do |g|
      g.template_engine :slim
    end
  end
end
