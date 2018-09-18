require 'text'
require 'order'
require 'menu'
require 'twilio-ruby'
require 'date'

describe Text do

  let(:order) { Order.new }
  let(:text) { described_class.new(order) }

  context "places text message" do
    it "outputs delivery message" do
      time = Time.new(2018, 11, 10, 11, 11)
      local_text = Text.new(order)
      expect( local_text.message(time) ).to eq("Thank you! Your order was placed and will be delivered before 12:11.")
    end


    # it 'raises error if order.add_total is not correct' do
    #   expect { text.message }.to raise_error("I'm sorry, there's an error in the total. Please place your order again.")
    # end
  end

  # context "send text via Twilio" do
  #
  # end
end
