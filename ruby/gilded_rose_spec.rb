require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  context "update_quality method" do
    it "reduces quality by 1 for normal items" do
      items = [Item.new("Normal Item", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
    end

    it "reduces quality by 2 for Conjured items" do
      items = [Item.new("Conjured Mana Cake", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it "increases quality for Aged Brie" do
      items = [Item.new("Aged Brie", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(11)
    end

    it "does not increase quality above 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it "keeps quality at 80 for Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(80)
    end

    it "increases quality for Backstage passes" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(21)
    end

    it "increases quality by 2 when sell_in is 10 or less for Backstage passes" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(22)
    end

    it "increases quality by 3 when sell_in is 5 or less for Backstage passes" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(23)
    end

    it "sets quality to 0 after the concert date for Backstage passes" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
  end
end
