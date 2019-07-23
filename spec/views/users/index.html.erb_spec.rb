require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :view do

  let(:user) { create(:user) }  # equivalent to User.create({})
  let!(:all_users) { create_list(:random_user, 13) }

  before do
    sign_in(user)
  end

      it 'displays the correct links and text' do
        render
        expect(rendered).to have_link href: "/profiles/#{User.first.id}"
        expect(rendered).to have_text('All Users')
      end
end
