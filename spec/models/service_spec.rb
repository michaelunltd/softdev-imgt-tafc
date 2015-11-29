require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has a monthly fee' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 5000)
    @service = Service.find 1
    expect(@service.complete_name).to eq 'Service A'
    expect(@service.monthly_fee).to eq 5000
  end

  it 'can have a service type' do
    Service.create(name: 'Service A',
      service_type: 'Type A',
      monthly_fee: 3000)
    @service = Service.find 1
    expect(@service.complete_name).to eq 'Service A w/ Type A'
    expect(@service.monthly_fee).to eq 3000
  end

  it 'can have other related costs' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 3000)
    @service = Service.find 1
    @service.related_costs << RelatedCost.new(nature: 'Registration Fee',
      value: 250)
    expect(@service.related_costs[0].value).to eq 250
    expect(@service.related_costs[0].nature).to eq 'Registration Fee'
  end
  it 'calculates total cost from all other listed fees' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 3000)
    RelatedCost.create(nature: 'Registration Fee',
      value: 250)
    RelatedCost.create(nature: 'BIR Fee',
      value: 750)
    @service = Service.find 1
    @service.related_costs << RelatedCost.find(1)
    @service.related_costs << RelatedCost.find(2)

    expect(@service.total_cost).to eq 4000
  end

  it 'defaults to is_template == true' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 3000)
    @service = Service.find 1

    expect(@service.is_template).to eq true
  end

  it 'can make "real" non-template services' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 3000)
    @service = Service.find 1

    @real_service = @service.make
    @real_service.save

    @test_service = Service.find 2
    expect(@test_service.is_template).to eq false
    expect(@test_service).to eq @service
  end

  it 'can return only the important info of a service' do
    Service.create(name: 'Service A',
      service_type: 'none',
      monthly_fee: 3000)
    @service = Service.find 1

    expect(@service.info_hash).to eq({'name' => 'Service A',
      'service_type' => 'none',
      'monthly_fee' => 3000})
  end
  it 'has its type default to none'
  it 'can not have a fee of lower than zero'
  it 'templates to only related cost templates'
  it 'non-templates to only related cost non templates'
end
