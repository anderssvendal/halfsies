require 'fssm'
require 'RMagick'

def resize_file(file) 
  resized_file = file.sub "@2x.", "."

  begin
    original = Magick::Image.read(file).first

    if original.columns % 2 != 0
      puts 'WARNING: Image width is not divisible by 2'
    end
    if original.rows % 2 != 0
      puts 'WARNING: Image height is not divisible by 2'
    end

    resized = original.resize(original.columns / 2, original.rows / 2)
    resized.write resized_file
  rescue
    puts 'Error resizing file'
  end
end

FSSM.monitor('.', '**/*@2x*') do
  update do |base, relative| 
    file = File.join(base, relative)
    puts "UPDATED: #{file}"
    resize_file file
  end
  create do |base, relative|
    file = File.join(base, relative)
    puts "CREATED: #{file}"
    resize_file file
  end
end