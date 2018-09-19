require 'menu'

describe Menu do

  let(:dishes) { [{ "Mud Pie" => 6.95}, {"Snozzcumbers" => 8.95 }] }
  let(:menu) { described_class.new(dishes) }

  context "menu_list" do
    it "has a list of dishes and prices" do
      expect(menu.menu_list).to eq(dishes)
    end

    it "prints the menu in human readable format" do
      expect(menu.printed_list).to eq("Mud Pie, £6.95, Snozzcumbers, £8.95")
    end
  end
end
