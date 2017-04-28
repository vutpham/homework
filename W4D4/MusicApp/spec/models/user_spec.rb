require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(email: "robin@robin.com", password: "password") }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it 'returns true for correct password' do
      expect(user.is_password?("password")).to be true
    end
    it 'returns false for incorrect password' do
      expect(user.is_password?("passsword")).to be false
    end
  end

  describe "#reset_session_token" do
    it "resets the user's session token" do
      token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(token)
    end
  end

  describe "::find_by_credentials" do
    it "finds a user given correct credentials" do
      user_found = User.find_by_credentials(user.email, "password")
      expect(user_found).to eq(user)
    end
    it "returns nil if no users are found" do
      expect(User.find_by_credentials("robin@robin.com", "pasdsword")).to be nil
    end
  end
end
