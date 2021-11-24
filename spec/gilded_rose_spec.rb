# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end

  describe '#update_quality' do
    items = [
      Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
      Item.new(name = 'Aged Brie', sell_in = 2, quality = 0),
      Item.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
      Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
      Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
      Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
      Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)
    ]
    GildedRose.new(items).update_quality

    it 'Vests - expect sell_in and quality to drop by 1' do
      expect(items[0].name).to eq '+5 Dexterity Vest'
      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(19)
    end

    it 'Aged items - expect sell_in to reduce by 1 and quality increase by 1' do
      expect(items[1].name).to eq 'Aged Brie'
      expect(items[1].sell_in).to eq(1)
      expect(items[1].quality).to eq(1)
    end

    it 'Elixirs - expect sell_in and quality to drop by 1' do
      expect(items[2].name).to eq 'Elixir of the Mongoose'
      expect(items[2].sell_in).to eq(4)
      expect(items[2].quality).to eq(6)
    end

    it 'Sulfuras - expect sell_in and quality no to change' do
      expect(items[3].name).to eq 'Sulfuras, Hand of Ragnaros'
      expect(items[3].sell_in).to eq(0)
      expect(items[3].quality).to eq(80)
    end

    it 'Sulfuras - expect sell_in and quality no to change' do
      expect(items[4].name).to eq 'Sulfuras, Hand of Ragnaros'
      expect(items[4].sell_in).to eq(-1)
      expect(items[4].quality).to eq(80)
    end

    it 'Backstage passes - expect sell_in to reduce by 1 and quality increase by 1' do
      expect(items[5].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
      expect(items[5].sell_in).to eq(14)
      expect(items[5].quality).to eq(21)
    end

    it 'Backstage passes - expect sell_in to reduce by 1 and quality increase by 2' do
      expect(items[6].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
      expect(items[6].sell_in).to eq(9)
      expect(items[6].quality).to eq(50)
    end

    it 'Backstage passes - expect sell_in to reduce by 1 and quality increase by 3' do
      expect(items[7].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
      expect(items[7].sell_in).to eq(4)
      expect(items[7].quality).to eq(50)
    end

    it 'Conjured items - expect sell_in to reduce by 1 and quality to drop by 2' do
      expect(items[8].name).to eq 'Conjured Mana Cake'
      expect(items[8].sell_in).to eq(2)
      expect(items[8].quality).to eq(4)
    end

    context 'update_quality#edge test' do
      days = 10
      gilded_rose = GildedRose.new items
      (0...days).each do |day|
        it "day #{day} edge test" do
          expect(items[3].sell_in).to eq(0)
          expect(items[3].quality).to eq(80)
          expect(items[6].quality).to eq(50)
          expect(items[7].quality).to eq(50)
          gilded_rose.update_quality
          next if day < 1

          expect(items[8].quality).to eq(0)
        end
      end
    end
  end
end
