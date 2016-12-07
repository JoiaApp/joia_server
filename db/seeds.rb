# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a Group
groups = Group.create!([
  {name: 'Joia Devs'}
]);

# Create a User
users = User.create!([
  {name: 'Danny Anderson', email: 'danielstephenanderson@gmail.com', role: 'admin', password: 'secret'}, 
  {name: 'Greg Arnell', email: 'gregarnell@sirsidynix.com', role: 'admin', password: 'secret'}, 
  {name: 'Josh Bodily', email: 'joshbodily@gmail.com', role: 'admin', password: 'secret'}, 
  {name: 'Test User', email: 'test@gmail.com', password: 'secret'}
])

user_groups = UserGroup.create!([
  {user_id: users.first.id, group_id: groups.first.id},
  {user_id: users.second.id, group_id: groups.first.id},
  {user_id: users.third.id, group_id: groups.first.id},
  {user_id: users.last.id, group_id: groups.first.id}
])


# Create some Prompts
prompts = Prompt.create!([
  {phrase: 'I laughed today when...'},
  {phrase: 'I smiled today because...'},
  {phrase: 'I cried today because...'},
  {phrase: 'I was happy today because...'},
  {phrase: 'Somebody did something nice...'},
  {phrase: 'Somebody said something nice...'},
  {phrase: 'A nice thing happened...'}
]);

# Create some responses
responses = Response.create!([
  {user_id: users.first.id, group_id: groups.first.id, prompt: prompts.first.phrase, text: "Lorem ipsum..." },
  {user_id: users.second.id, group_id: groups.first.id, prompt: prompts.first.phrase, text: "Lorem ipsum..." },
  {user_id: users.third.id, group_id: groups.first.id, prompt: prompts.first.phrase, text: "Lorem ipsum..." },
  {user_id: users.last.id, group_id: groups.first.id, prompt: prompts.first.phrase, text: "Lorem ipsum..." }
])

# Create some Sponsors
sponsors = Sponsor.create!([
  { name: 'Gizmonic Institute', image:'http://images.all-free-download.com/images/graphiclarge/orange_gear_icon_vector_280682.jpg', url: 'http://gizmonic.com'}
]) 
