require_dependency "factory_girl_web/application_controller"

module FactoryGirlWeb
  class FixturesController < ApplicationController
    def index
      @fixtures = Fixture.all
    end

    def create
      fixture = Fixture.new(permitted_params)

      if fixture.create
        redirect_to :back, notice: format("%{model} was successfully created.", model: fixture.name_i18n)
      else
        redirect_to :back, alert: fixture.errors.full_messages.to_sentence
      end
    end

    private

    def permitted_params
      params.require(:fixture).permit(:name, :traits, :amount)
    end
  end
end
