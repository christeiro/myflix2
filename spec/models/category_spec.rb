require 'spec_helper'

describe Category do
  it { should have_many(:videos) }
  it "saves itself" do
    category = Category.new(name: "Test category")
    category.save
    expect(Category.first).to eq(category)
  end

  it "has many videos" do
    cartoons = Category.create!(name: "Cartoons")
    monk = Video.create(title: "Monk", description: "Monk description", category: cartoons)
    futurama = Video.create(title: "Futurama", description: "Futurama description", category: cartoons)
    expect(cartoons.videos).to include(monk, futurama)
  end
end