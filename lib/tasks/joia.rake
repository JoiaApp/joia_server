namespace :joia do
  PHRASES = [
    "I smiled today because...",
    "I felt loved today when...",
    "My job was made easier today when...",
    "I had fun today when...",
    "It was great seeing...",
    "I feel better about the future because...",
    "I was happily surprised when...",
    "It's exciting to see...",
    "I appreciate that...",
    "I found it refreshing that...",
    "I felt closer to...",
    "My day changed when...",
    "It really helped me when...",
    "I laughed today when...",
    "Something I learned from...",
    "I feel peace when...",
    "I felt special today because...",
    "I want to be better because...",
    "When I thought nobody noticed...",
    "It's great to see when...",
    "I seriously wanted to dance when...",
    "I cried tears of joy when...",
    "I wanted to high five everyone around when...",
    "The time and effort was worth it when...",
    "People began opening up when...",
    "I loved spending time with...", 
    "Holidays feel special when...", 
    "I gained confidence when...", 
    "The community is lucky that...", 
    "It felt like the whole room lit up when...", 
    "The example provided by...", 
    "It always makes vacations better when...", 
    "I feel inspired to try something new because...", 
    "I was touched when...", 
    "I thought I was going crazy today, until...", 
    "I'm always impressed by...", 
    "I feel like I can do anything when...", 
    "When I felt stuck today, ...", 
    "The character shown by...", 
    "It feels like a gift when...", 
    "I treasure when..."
  ] 

  desc "Seed prompts table with data"
  task :seed_prompts => :environment do
    Prompt.delete_all
    prompts = Prompt.create!(PHRASES.map { |phrase| { phrase: phrase } });
  end
end
