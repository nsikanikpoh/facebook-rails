require 'rails_helper'


# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.
RSpec.describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Request. As you add validations to Request, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }

  context 'when user is logged in' do

    before do
      sign_in(user)
    end

    describe "GET #index" do
      it 'shows the users index page' do
          get :index
          expect(response).to have_http_status(:success)
      end
    end

  end

  context 'when user is NOT logged in' do

    describe "GET #index" do
      it 'rediects to login' do
          get :index
          expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end
