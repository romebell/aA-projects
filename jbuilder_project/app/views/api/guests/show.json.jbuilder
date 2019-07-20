json.partial! 'api/guests/guest', guest: @guest 
json.gifts @guest.gifts


# json.extract! @guest, :gifts
# json.extract! @guest, :name, :age, :favorite_color, :gifts