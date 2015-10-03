require 'spec_helper'

describe Behance::Client do

  before do
    @client = Behance::Client.new(access_token: "abc123")
  end

  it "initializes properly" do
    @client.should be_a_kind_of Behance::Client
  end

end
