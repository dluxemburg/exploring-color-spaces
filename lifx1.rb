require 'lifx'

client = LIFX::Client.lan
client.discover

while client.lights.count < 1
  sleep(1)
end

puts "Found #{client.lights.count} light(s)"

puts "Turning them on"
client.lights.turn_on

puts "Waiting 5 seconds"
sleep(5)

puts "Turning them off"
client.lights.turn_off