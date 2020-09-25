require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe DeliverDailyMailWorker, type: :worker do
  it "delivers email" do
    expect {DeliverDailyMailWorker.perform_async}
      .to change(DeliverDailyMailWorker.jobs, :size).by(1)
  end
end
