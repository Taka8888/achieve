# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# n = 1
# while n <= 100
#   Blog.create(
#     title: "あああ",
#     user_id: n
#   )
#   n = n + 1
# end

# num = 1
# until num <= 100 do
#   Blog.create(
#   title:"あああ",
#   user_id: num)
#   num = num + 1
# end

n = 1
while n <= 100
  Blog.create(
    title: "あああ",
    content: "hoge",
    user_id: n
  )
  n = n + 1
end