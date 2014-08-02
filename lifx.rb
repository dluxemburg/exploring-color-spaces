require 'lifx'

client = LIFX::Client.lan
client.discover

while client.lights.count < 1
  sleep(1)
end

puts "Found #{client.lights.count} light(s)"

puts "Turning them on"
client.lights.turn_on

puts "Turning them teal"
teal = LIFX::Color.rgb(53, 135, 157)
client.lights.set_color(teal)

puts "Waiting 5 seconds"
sleep(5)

puts "Turning them back to white and then off"
white = LIFX::Color.rgb(255, 255, 255)
client.lights.set_color(white)
sleep(5)
client.lights.turn_off
