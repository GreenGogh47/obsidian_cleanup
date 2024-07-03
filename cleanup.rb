require 'find'

def replace_goals_in_file(file_path)
  content = File.read(file_path)
  new_content = content.gsub('[[Goals]]', 'Goals')

  File.write(file_path, new_content) if new_content != content
end

def process_directory(directory)
  Find.find(directory) do |path|
    if File.file?(path) && File.extname(path) == '.md'
      replace_goals_in_file(path)
      puts "Processed: #{path}"
    end
  end
end

target_directory = ARGV[0] || '.'

process_directory(target_directory)