require 'spec_helper'

describe Note do

  describe "Mass Assignment" do
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:content) }
  end

  describe "Methods" do
    let(:note){ Factory(:note) }

    describe "#as_json" do
      context "when invoking with no params" do
        let(:json){ note.to_json }
        it "should return a json with just id, title and content" do
          json.should be_json_eql( %({"id":"#{note.id}","title":"#{note.title}", "content":"#{note.content}" }) )
        end
      end
      context "when invoking with options" do
        let(:json){ note.to_json(:only => [:id, :content]) }
        it "should call to super with that options" do
          json.should be_json_eql( %({"id":"#{note.id}", "content":"#{note.content}" }) )
        end
      end
    end
  end

end
