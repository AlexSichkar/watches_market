require 'rails_helper'

RSpec.describe "Watches", type: :request do
#   describe "GET /index" do
#
#     let(:watches) {create_list :watch, 3}
#
#     before {get:index}
#   end
describe "GET /index" do
  let(:watches) {create_list :watch, 5}

  before ("GET /index") do

  end

  context 'required output per page' do
    # it 'render to index template' do
    #   is_expected.to render_template :index
    # end
    it 'instance var watches include only watches' do
      expect(assigns(key :watches)).to match_array(watches)
    end
  end
end
end
