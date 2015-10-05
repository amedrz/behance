require 'spec_helper'

describe Behance::Client::Project do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#projects" do
    context "without parameters" do
      before do
        stub_get("projects").with(query: @options).
          to_return(body: fixture("projects.json"))
        @projects = @client.projects
      end

      it "makes a http request" do
        a_get("projects").
          with(query: @options).should have_been_made
      end

      it "gets a list of projects" do
        @projects.size.should == 12
      end
    end

    context "with parameters" do
      before do
        @options.merge!(q: "yolo", page: 2)
        stub_get("projects").with(query: @options).
          to_return(body: fixture("projects.json"))
      end

      it "gets a list of projects" do
        @client.projects(@options).size.should == 12
      end
    end
  end

  describe "#project" do
    before do
      stub_get("projects/4889175").with(query: @options).
        to_return(body: fixture("project.json"))
      @project = @client.project(4889175)
    end

    it "makes a http request" do
      a_get("projects/4889175").
        with(query: @options).should have_been_made
    end

    it "gets a single project" do
      @project["id"].should == 4889175
    end
  end

  describe "#project_comments" do
    before do
      stub_get("projects/1/comments").with(query: @options).
        to_return(body: fixture("project_comments.json"))
      @comments = @client.project_comments(1)
    end

    it "makes a http request" do
      a_get("projects/1/comments").
        with(query: @options).should have_been_made
    end

    it "gets a list of comments" do
      @comments.size.should == 396
    end
  end
end
