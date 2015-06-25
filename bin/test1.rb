#!/usr/bin/env ruby

require_relative "../lib/recipe_dsl"

#================================================================================
#==== main
#================================================================================
if __FILE__ == $0

  $stderr.sync = true
  $stdout.sync = true
  puts()

  # fetch command-line parameter
  dsl_file_spec = ARGV.shift
  raise "missing command line parameter" if dsl_file_spec.nil?

  # load/eval the dsl text
  dsl_file_content = File.read(dsl_file_spec)
  RecipeDsl.module_eval(dsl_file_content)

  # make use of it
  RecipeDsl._recipes.each do |r|
    printf("======== %s\n\n", r.title)
    printf("%s\n\n", r.description.chomp)
    r.ingredients.each do |i|
      printf("    %s, %s\n", i.name, i.quantity)
    end
    puts()
  end

end
