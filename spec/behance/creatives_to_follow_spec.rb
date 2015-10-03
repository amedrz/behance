require 'spec_helper'

describe Behance::Client::CreativesToFollow do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#creatives_to_follow" do
    context "without parameters" do
      before do
        stub_get("creativestofollow").with(query: @options).
          to_return(body: fixture("creatives_to_follow.json"))
        @creatives_to_follow = @client.creatives_to_follow
      end

      it "makes a http request" do
        a_get("creativestofollow").
          with(query: @options).should have_been_made
      end

      it "gets a list of creatives to follow" do
        @creatives_to_follow.size.should == 10
      end
    end

    context "with parameters" do
      before do
        @options.merge!(page: 2)
        stub_get("creativestofollow").with(query: @options).
          to_return(body: fixture("creatives_to_follow.json"))
      end

      it "gets a list of creatives to follow" do
        @creatives_to_follow = @client.creatives_to_follow(@options).size.
          should == 10
      end
    end
  end
end
