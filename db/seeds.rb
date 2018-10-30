# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adam = User.create({ email: 'adam@dragondrop.uk', username: 'adam', password: 'password' })
john = User.create({ email: 'john@dragondrop.uk', username: 'john', password: 'password' })
jonathan = User.create({ email: 'jonathan@dragondrop.uk', username: 'jonathan', password: 'password' })

articles = Article.create([
  {
    author: jonathan,
    title: "The Great “Oops…we’re sorry” Email Conspiracy.",
    description: "Have they really made a mistake or was the mistake deliberately engineered?",
    body: "One of the tried and tested techniques to boost the value of your email marketing efforts is to resend an email shortly after the first, without change, to the set of customers who didn’t open the first — see this [nice article](http://www.mailchimp.com) from Mailchimp giving some stats (and some of the possible risks).

There’s a variant to this technique that seems to trending upwards these days — the “Oops…we’re sorry” email. Some minor mistake in the original needs to be corrected so the organisation resends the email, with a bit of extra text to explain what went wrong and how they’re correcting it."
  },
  {
    author: john,
    title: "How to constantly deliver user needs by taking slices through your product's many layers.",
    description: " By focusing on a series of specific user needs rather than creating the entire product in one go, you're more likely to create a product which is more concise, more coherent, delivers a better user experience, and likely even delivered sooner.",
    body: "Delivering a great solution isn't as simple as just having capable people— although at Dragon Drop we do have those— you also need to follow good processes.

A common approach to building pretty much anything is to follow a layered process. For instance, if you were building a house, you'd follow a fairly strict process of laying the foundations, building the walls, putting on the roof, and finishing with the decoration.

It's not unusual in software development to try and follow a similar process, where each member of the team is allowed to have their turn layering up the solution:

1. The analyst reviews the client's needs
2. The designers create screens showing the proposed end result
3. The developers implement the solution, merging the needs and the screens
4. The client reviews the solution"
  },
  {
    author: adam,
    title: "User-centric pricing: How the right pricing models make better products.",
    description: "(Or — why Netflix makes really good TV shows.)",
    body: "Money is one of the most uncomfortable topics of conversation. Maybe that’s why in business, we tend to talk so much about everything else.

Creative companies often spend a long time on their creative process, their development process, their company culture — and then, they just ‘price’ it, in a way they hope potential clients will like.

In doing this we discuss pricing as a completely separate entity to the products and services we develop.

But, what if how we price things for our clients affects the very users we build products and services for, and try to put at the centre of our development processes?

What if having a user-centric design process, development process and company culture could all be undone by the wrong pricing model?

In reality, the user experience of the products you build is directly influenced by how you charge your clients for those products.

The old adage says that ‘you get what you pay for’, but we need to add ‘and how you pay for it’.

Let me explain with an example: _Netflix Originals_."
  },
])


users = 10.times.collect {|i| User.create(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email, password: Faker::Internet.password)}

articles = 100.times.collect do |i|
  Article.create({
    author: users.sample,
    title: Faker::Lorem.unique.sentence,
    description: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs
  })
end
