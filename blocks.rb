def run(&block)
  yield "block"
  block.call "block"
  block["block"]
  # block.("block") # only ruby 1.9+
end

run {|name| puts "Hi from #{name}!" }
