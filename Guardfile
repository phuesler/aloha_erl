# # -*- encoding : utf-8 -*-

guard 'shell' do
  watch(%r{^src/.+\.erl$}) do |m|
    puts `rebar compile`
  end
end
