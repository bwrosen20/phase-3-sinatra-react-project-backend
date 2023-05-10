puts "🌱 Seeding spices..."

Book.destroy_all
Note.destroy_all

i=0

pictures=["https://a-z-animals.com/media/Penguin-Aptenodytes-Forsteri-walking-on-beach.jpg",
"https://i.natgeofe.com/n/9dce4946-8f87-4d16-acd7-f14b1ef7e12c/emperor-penguin_01_square.jpg",
"https://image.pbs.org/video-assets/Vtw3T4t-asset-mezzanine-16x9-Bf5n3hO.png",
"https://images.unsplash.com/photo-1598439210625-5067c578f3f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
"https://www.americanhumane.org/app/uploads/2022/01/Emperor-penguin2.png",
"https://media.audubon.org/sfw_15586958314_eabee7f9c4_o.jpg",
"https://i.natgeofe.com/n/9dce4946-8f87-4d16-acd7-f14b1ef7e12c/emperor-penguin_01_square.jpg",
"https://www.bas.ac.uk/wp-content/uploads/2015/05/e3820ab70e0fb6cbeaa415f5f46f58fa_1431425888.jpg",
"https://www.rd.com/wp-content/uploads/2020/01/emperor-penguins-brave-a-storm-in-the-antarctica-jan-2016.jpg?fit=700,1024",
"https://www.cabq.gov/artsculture/biopark/news/10-cool-facts-about-penguins/@@images/1a36b305-412d-405e-a38b-0947ce6709ba.jpeg"]


    10.times do
        Book.create(title: Faker::Book.title, author: Faker::Book.author,
        genre: Faker::Book.genre, blurb: Faker::Lorem.paragraph,
        image_url: pictures[i], read: Faker::Boolean.boolean)
        i+=1
    end

    Book.where("read=true").each do |book|
        a=0
    b=50
        5.times do
            
            Note.create(rating: rand(1.0..10.0).round(1),body: 
            Faker::Lorem.paragraph,
             book_id: book.id, pages_read: rand(a..b))
             a=a+75
            b=b+75
    end
    
end

puts "✅ Done seeding!"
