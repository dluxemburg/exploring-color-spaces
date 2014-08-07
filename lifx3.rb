require 'lifx'

client = LIFX::Client.lan
client.discover

while client.lights.count < 1
  sleep(1)
end

client.lights.turn_on

Signal.trap("INT") {
  client.lights.turn_off
  exit
}

while raw = $stdin.gets
  numbers = raw.split(',').map(&:to_i)
  color = LIFX::Color.rgb(*numbers)
  client.lights.set_color(color)
end
