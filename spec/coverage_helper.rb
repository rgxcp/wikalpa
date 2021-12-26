require "simplecov"
require "simplecov-cobertura"

SimpleCov.start
SimpleCov.formatter = if ENV["CI"]
  SimpleCov::Formatter::CoberturaFormatter
else
  SimpleCov::Formatter::HTMLFormatter
end
