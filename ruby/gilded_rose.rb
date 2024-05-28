class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_item_quality(item)
      update_item_sell_in(item)
    end
  end

  private

  def update_item_quality(item)
    case item.name
    when "Aged Brie"
      increase_quality(item)
    when "Backstage passes to a TAFKAL80ETC concert"
      update_backstage_pass_quality(item)
    when "Conjured Mana Cake"
      decrease_quality(item, 2)
    when "Sulfuras, Hand of Ragnaros"
      return
    else
      decrease_quality(item)
    end
  end

  def update_backstage_pass_quality(item)
    increase_quality(item)
    increase_quality(item) if item.sell_in < 11
    increase_quality(item) if item.sell_in < 6
    decrease_quality(item) if item.sell_in < 1
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def decrease_quality(item, value = 1)
    item.quality -= value if item.quality > 0
    item.quality = 0 if item.sell_in < 1
  end

  def update_item_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
