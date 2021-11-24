# frozen_string_literal: true

require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.name.include?('Aged') || item.name.include?('Backstage') ? quality_increase(item) : quality_decrese(item)
      time_control(item)
    end
  end

  private

  def quality_increase(item)
    if item.name.include?('Aged') || item.sell_in > 10
      item.quality += 1
    else
      item.sell_in > 5 ? item.quality += 2 : (item.quality += 3 if item.sell_in.positive?)
    end
    item.quality = 50 if item.quality > 50
  end

  def quality_decrese(item)
    item.quality -= item.name.include?('Conjured') ? 2 : 1 unless item.name.include?('Sulfuras')
    item.quality = 0 if item.name.include?('Backstage') && item.sell_in.negative? || item.quality.negative?
  end

  def time_control(item)
    item.sell_in -= 1 unless item.name.include?('Sulfuras')
  end
end
