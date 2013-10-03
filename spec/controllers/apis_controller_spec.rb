require 'spec_helper' 

describe ApisController do
  context 'apis#show' do
    let!(:lamp) { create(:lamp) }
    it 'should return correct json data' do
      expected = "[\"000.000.0.000\",{\"1\":{\"turn_off\":null,\"colorloop_on\":null,\"set_brightness\":\"30\"}}]"
      get :show, secret_token: 'b642b4217b34b1e8d3bd915fc65c4452'
      expect(response.body).to eq expected
    end
  end
end