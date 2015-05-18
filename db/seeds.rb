# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Blogpost.delete_all

cody = Admin.create( {id: 1, name: "Cody Ma", email: "cody_ma@brown.edu", password: "foobar12", password_confirmation: "foobar12"} )

cody.blogposts.create(title: "Hello World!",
                      content:
                      "Markdown Test This is my very *first* post using Markdown I learned it from [Google](http:/www.google.com)",
                     public: 'true',
                     created_at: Time.now - 1.day)

cody.blogposts.create(title: "Second post",
                     content: "Content of second blog post",
                     public: 'true',
                     created_at: Time.now)

cody.blogposts.create(title: "Lorem Ipsum",
                     content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vitae pharetra massa. Aliquam porta urna risus. Integer posuere posuere est, eu tincidunt ipsum congue et. Maecenas hendrerit diam ut fringilla viverra. In sed efficitur mauris, sit amet tristique ligula. Aliquam at semper ex. Donec sagittis malesuada luctus. Phasellus tortor arcu, sollicitudin eu sapien in, pretium mattis quam. Sed augue erat, posuere sit amet laoreet scelerisque, lobortis in ipsum.",
                     public: 'true',
                     created_at: Time.now)
