require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]


  next unless behavior == 'naughty'

  kid_infraction = kid.split("|")
  infraction = kid_infraction[1]
  toys_new = []
  toys.each do |toy|
    if toy = 'Kaleidoscope'
      toys_new = toys - [toy]
    end
  end

  toy_received = toys_new.sample
  toys_not_received = toys - [toy_received]

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
