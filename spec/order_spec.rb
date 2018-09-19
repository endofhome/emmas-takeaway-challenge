require 'order'

describe Order do

  let(:menu) { double :menu }
  let(:order) { described_class.new(menu) }

  context "records order" do

    it "outputs chosen items from menu" do
      order.chosen_dishes("pickled vegetables", 2) 
      expect(order.item["pickled vegetables"]).to eq(2)
    end

    it "outputs total of items from order" do
      allow(menu).to receive(:menu_list) { [{ "dingleberries" => 2.50 }] }

      order.chosen_dishes("dingleberries", 2)
      expect(order.add_total).to eq(5.00)
    end
  end
end
