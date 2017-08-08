require 'rails_helper'

RSpec.describe Question, type: :model do
	
	context "attributes" do
	  	let(:question) {Question.new(title: "New Question Title", body: "New Question Body", resolved: false) }
		
	  	it "Should respond to title" do
			expect(question).to respond_to(:title)
	  	end
		
	  	it "Should respond to body" do
			expect(question).to respond_to(:body)
	  	end
		
	  	it "Should respond to resolved" do
			expect(question).to respond_to(:resolved)
	  	end
	end
end
