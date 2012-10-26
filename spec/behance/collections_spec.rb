require 'spec_helper'

describe Behance::Client::Collections do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#collections" do
    context "without parameters" do
      before do
        stub_get("collections").with(query: @options).
          to_return(body: fixture("collections.json"))
        @collections = @client.collections
      end

      it "makes a http request" do
        a_get("collections").
          with(query: @options).should have_been_made
      end

      it "gets an collections list" do
        @collections.size.should == 3
      end
    end

    context "with parameters" do
      before do
        @options.merge!(q: "-FASHION")
        stub_get("collections").with(query: @options).
          to_return(body: fixture("collections.json"))
      end

      it "gets an collections list" do
        @collections = @client.collections(@options).size.should == 3
      end
    end
  end

  describe "#collection" do
    before do
      stub_get("collections/1").with(query: @options).
        to_return(body: fixture("collection.json"))
      @collection = @client.collection(1)
    end

    it "makes a http request" do
      a_get("collections/1").
        with(query: @options).should have_been_made
    end

    it "gets a single collection" do
      @collection["id"].should == "4776629"
    end
  end

  describe "#collection_projects" do
    context "without parameters" do
      before do
        stub_get("collections/1/projects").with(query: @options).
          to_return(body: fixture("collection_projects.json"))
        @projects = @client.collection_projects(1)
      end

      it "makes a http request" do
        a_get("collections/1/projects").
          with(query: @options).should have_been_made
      end

      it "gets a list of projects" do
        @projects.size.should == 2
      end
    end

    context "with parameters" do
      before do
        @options.stub!(page: 1, time: Time.new)
        stub_get("collections/1/projects").with(query: @options).
          to_return(body: fixture("collection_projects.json"))
      end

      it "gets a list of projects" do
        @projects = @client.collection_projects(1, @options).
          size.should == 2
      end
    end
  end
end
