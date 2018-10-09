require 'yaml'
require 'colorize'
require 'erb'

# Tool build to deploy docker environments
class GenEnv
  def initialize
    if ARGV[0] == 'build'
      build
    elsif ARGV[0] == 'destroy'
      destory
    else
      raise 'Invalid Options Selected!!!'
    end
  end

  def build
    template_file = 'docker-compose.yml.erb'
    puts '[INFO] '.green + '- Loading erb shell'
    template = File.read(template_file)
    result = ERB.new(template).result(binding)

    File.open('buildproxy/config/squid.conf', 'w+') do |f|
      puts '[SUCCESS] '.green + '- Writing Content to docker-compose.yml'
      f.write result
    end
  end
end

# begin
  GenEnv.new
# rescue => exception
#   puts '[ERROR]'.red + " #{exception}"
# end



# Generate an alias for: ssh -i platform/secrets/alia alia@localhost -p 1023
