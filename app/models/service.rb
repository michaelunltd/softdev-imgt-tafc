class Service < ActiveRecord::Base
  include Modules::InfoHashable

  has_many :related_costs
  validates :name, presence: true
  validates :monthly_fee, numericality: { greater_than_or_equal_to: 0 }
  validate :template_status_must_match_all_template_statuses_of_related_costs

  before_save :no_type_becomes_none

  def complete_name
    return name if service_type == 'none'
    "#{name} w/ #{service_type}"
  end

  def total_cost
    monthly_fee + related_costs.inject(0) { |sum, item| sum + item.value }
  end

  def make
    @new_thing = dup
    @new_thing.is_template = false

    @new_thing
  end

  def no_type_becomes_none
    self.service_type = 'none' if service_type.blank?
  end

  def template_status_must_match_all_template_statuses_of_related_costs
    related_costs.each do |related_cost|
      errors.add(:is_template, 'TemplateMismatchError') if related_cost.is_template != is_template
    end
  end
end
