require "spec_helper"

describe ListMailer do
  let(:owner) {User.create!(email: Faker::Internet.email)}
  let(:list) { List.create!(url: Faker::Internet.domain_word, owner: owner)}
  let(:user) { User.create!(email: Faker::Internet.email) }
  let!(:subscription) { list.subscribe(user) }

  describe "creation_confirmation_email" do
    let(:mail) { ListMailer.creation_confirmation_email(list) }

    it "renders the headers" do
      mail.subject.should eq("Get started with your new list!")
      mail.to.should eq([owner.email])
      mailed_from_list_email?
    end

    it "renders the body" do
      correct_link?
    end
  end


  describe "subscription_confirmation_email" do
    let(:mail) { ListMailer.subscription_confirmation_email(subscription) }

    it "renders the headers" do
      mail.subject.should eq("Spread the word!")
      mail.to.should eq([user.email])
      mailed_from_list_email?
    end

    it "renders the body" do
      correct_link?
    end
  end

  describe "email_blast" do
    let(:mail) { ListMailer.email_blast(list) }

    it "renders the headers" do
      mail.subject.should eq("Your email list is ready")
      mail.to.should eq([owner.email, user.email])
      mailed_from_list_email?
    end

    it "renders the body" do
      list.emails.each do |email|
        mail.body.encoded.should match(email)
      end
    end

    it 'sends the email' do
      mail.deliver!
      ActionMailer::Base.deliveries.size.should eq(1)
    end
  end

  def mailed_from_list_email?
    mail.from.should eq(["#{list.url}@starterlist.com"])
  end

  def correct_link?
    mail.body.encoded.should match("http://starterlist.com/#{list.url}")
  end

end
