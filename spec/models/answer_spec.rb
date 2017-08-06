require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.new(title: "new question body", body: "new question body", resolved: false)}
  let(:answer) {Answer.new(question: question, body: "new answer body")}

  it "should respond to body" do
    expect(answer).to respond_to(:body)
  end

end
