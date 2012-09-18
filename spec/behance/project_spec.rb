require 'spec_helper'

describe Behance::Client::Project do
	
	before do
		@client = Behance::Client.new(:access_token => "abc123")
	end

	it "search for projects" do
		@client.projects.should == true
	end

	it "gets the information and content of a project" do
		@client.project(1).should == true
	end

	it "gets the comments for a project" do
		@client.project_comments(1).should == true
	end

end
