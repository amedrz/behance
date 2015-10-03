require 'spec_helper'

describe Behance::Client::Wips do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#wips" do
    context "without parameters" do
      before do
        stub_get("wips").with(query: @options).
          to_return(body: fixture("wips.json"))
        @wips = @client.wips
      end

      it "makes a http request" do
        a_get("wips").with(query: @options).should have_been_made
      end

      it "gets a list of wips" do
        @wips.size.should == 12
      end
    end

    context "with parameters" do
      before do
        @options.merge!(time: "today", page: 2)
        stub_get("wips").with(query: @options).
          to_return(body: fixture("wips.json"))
      end

      it "gets a list of wips" do
        @client.wips(@options).size.should == 12
      end
    end
  end

  describe "#wip" do
    before do
      stub_get("wips/69").with(query: @options).
        to_return(body: fixture("wip.json"))
      @wip = @client.wip(69)
    end

    it "should make a http request" do
      a_get("wips/69").with(query: @options).should have_been_made
    end

    it "gets a wip" do
      @wip["id"].should == 69
    end
  end

  describe "#wip_revision" do
    before do
      stub_get("wips/1/2").with(query: @options).
        to_return(body: fixture("wip_revision.json"))
      @revision = @client.wip_revision(1, 2)
    end

    it "makes a http request" do
      a_get("wips/1/2").with(query: @options).
        should have_been_made
    end

    it "gets a revision" do
      @revision["id"].should == 133
    end
  end

  describe "#wip_revision_comments" do
    context "without parameters" do
      before do
        stub_get("wips/1/2/comments").with(query: @options).
          to_return(body: fixture("wip_revision_comments.json"))
        @comments = @client.wip_revision_comments(1, 2)
      end

      it "makes a http request" do
        a_get("wips/1/2/comments").with(query: @options).
          should have_been_made
      end

      it "gets a list of comments" do
        @comments.size.should == 6
      end
    end

    context "with parameters" do
      before do
        @options.merge!(page: 2)
        stub_get("wips/1/2/comments").with(query: @options).
          to_return(body: fixture("wip_revision_comments.json"))
      end

      it "gets a list of comments" do
        @comments = @client.wip_revision_comments(1, 2, @options).size.
          should == 6
      end
    end
  end
end
