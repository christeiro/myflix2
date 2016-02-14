require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it "saves itself" do
    video = Video.new(title: "monk", description: "Funny video")
    video.save
    expect(Video.first).to eq(video)
  end

  it "belongs to category" do
    dramas = Category.create(name: "Dramas")
    monk = Video.create!(title: "Monk", description: "Monk description", category: dramas)
    expect(monk.category).to eq(dramas)
  end
end