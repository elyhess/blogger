# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

article_1 = Article.create!(title: "Title 1", body: "Body 1")
article_2 = Article.create!(title: "Title 2", body: "Body 2")

comment_1 = article_1.comments.create!(author_name: "Me", body: "Commenty comments")
comment_2 = article_1.comments.create!(author_name: "Her", body: "So much to say")
comment_3 = article_2.comments.create!(author_name: "Him", body: "Amazing content")
comment_4 = article_2.comments.create!(author_name: "She", body: "Wonderful stuff")