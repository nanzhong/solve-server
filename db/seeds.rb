# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Language.create([
  { name: 'ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-linux]', key: 'ruby', command: 'ruby _file_ _input_'},
  { name: 'Python 2.7.3', key: 'python2', command: 'python2 _file_ _input_'},
  { name: 'Python 3.2.3', key: 'python3', command: 'python3 _file_ _input_'},
  { name: 'PHP 5.3.10-1ubuntu3 with Suhosin-Patch (cli) (built: Apr 11 2012 17:25:33)', key: 'php', command: 'php _file_ _input_'}
])
