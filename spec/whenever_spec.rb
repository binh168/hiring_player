require "spec_helper"
require "whenever"
require "pry"
require "shoulda/whenever/schedule_matcher"

describe "Schedule" do
  include Shoulda::Whenever

  it "sends daily mail at 6:00am" do
    output = Whenever::JobList.new(file: File.join("config/schedule.rb")).generate_cron_output
    expect(output).to include("0 6 * * *")
  end
end
