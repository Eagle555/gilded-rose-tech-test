# Gilded rose test

## Requirements 

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
- “Conjured” items degrade in Quality twice as fast as normal items

## How to use

### Running tests
```
rspec
```
### Running in console
```
irb -r ./lib/gilded_rose.rb
```

## Step 1 - Clean up the project

### initialisation

- git and rspec initialisation
- folder tree and files rename

### information

- readme file creation

## Step 2 - Refactor the tests

### Rspec

- legacy test moved to legacy test file but still used
- spec tests creation 

### Coverage 

- include SimpleCov

## Step 3 - Code refactoring

### methods

- functionality separation
- private methods

### condition

- removal of stacked multi-conditioning 

## Step 4 - Edge cases test

- Add loop in to spec for edge cases