module FactoryGirlWeb
  class Fixture
    include ActiveModel::Model

    attr_accessor :name, :traits, :amount

    delegate :factories, to: :class

    with_options presence: true do
      validates :name
      validates :amount, numericality: { only_integer: true, greater_than: 0 }
    end

    def create
      return unless valid?

      ActiveRecord::Base.transaction do
        FactoryGirl.create_list(name.to_sym, amount.to_i, *formatted_traits)
      end
    end

    def name_i18n
      name.to_s.classify.safe_constantize.try(:model_name).try(:human) || name
    end

    def defined_traits
      factories[name] || []
    end

    private

    def formatted_traits
      return [] if traits.blank?
      traits.map(&:to_sym)
    end

    class << self
      def all
        factories.keys.map { |name| new(name: name, amount: 1) }
      end

      def factories
        @factories ||= begin
          FactoryGirl.factories.sort_by(&:name).each_with_object(HashWithIndifferentAccess.new) do |factory, h|
            h[factory.name] = factory.defined_traits.map(&:name)
          end
        end
      end
    end
  end
end
