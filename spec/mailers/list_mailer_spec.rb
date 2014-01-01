require "spec_helper"

describe ListMailer do
  describe "creation_confirmation_email" do
    let(:mail) { ListMailer.creation_confirmation_email }

    it "renders the headers" do
      mail.subject.should eq("Creation confirmation email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "subscription_confirmation_email" do
    let(:mail) { ListMailer.subscription_confirmation_email }

    it "renders the headers" do
      mail.subject.should eq("Subscription confirmation email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "email_blast" do
    let(:mail) { ListMailer.email_blast }

    it "renders the headers" do
      mail.subject.should eq("Email blast")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
