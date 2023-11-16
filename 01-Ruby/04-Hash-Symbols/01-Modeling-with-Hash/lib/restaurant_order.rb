def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this restaurant order
  restaurant_menu = {}
  restaurant_menu["Hamburguer"] = 250
  restaurant_menu["Cheese Burger"] = 300
  restaurant_menu["Veggie Burger"] = 540
  restaurant_menu["Vegan Burger"] = 350
  restaurant_menu["Sweet Potatoes"] = 230
  restaurant_menu["Salad"] = 15
  restaurant_menu["Iced Tea"] = 70
  restaurant_menu["Lemonade"] = 90

  result = restaurant_menu[burger] + restaurant_menu[side] + restaurant_menu[beverage] 
  return result
end
