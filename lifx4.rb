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
  args = raw.split(/,| /)
  space = args.first.to_sym
  args = args.slice(1,3).map(&:to_f)
  args.unshift(space)
  color = LIFX::Color.send(*args)
  begin
    client.lights.set_color(color)
    puts "#{space}(#{args.slice(1,3).join(',')})"
  rescue; end
end
