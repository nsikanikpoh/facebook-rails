require 'rails_helper'

RSpec.describe Profile, type: :model do

  let(:user) { create(:user) }
  let(:profile) { build(:profile, user_id: user.id) }

  describe "Associations" do
     it { should belong_to(:user) }
   end


  it "is valid with valid attributes" do
    expect(profile).to be_valid
  end

  it "is not valid with a valid user_id" do
    profile.user_id = 0
    expect(profile).not_to be_valid
  end

  it "is not valid with a birthday in the future" do
    profile.birthday = '4515-02-28'
    expect(profile).not_to be_valid
  end

  it "is not valid with a gender that has too many characters" do
    profile.gender = 'qwert' * 20 + 'y'
    expect(profile).not_to be_valid
  end

  it "is not valid with a location that has too many characters" do
    profile.location = 'qwert' * 51 + 'y'
    expect(profile).not_to be_valid
  end

  it "is not valid with a bio that has too many characters" do
    profile.bio = 'qwert' * 400 + 'y'
    expect(profile).not_to be_valid
  end

end
