# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
titles  = ["Car", "Best car", "Awesome car", "Used car", "New car", "Something like a car", "Destroyed car" ]
descriptions = [
    'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly 
    transport people rather than goods. ... Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    
    "There's a world of choice in today's car market, what with more than 400 different models and many car types available. 
    Making sense of it all can be difficult. What are the different types of cars? The first thing to know is that \"cars\" means 
    \"passenger vehicles of all types.\" For the purposes of keeping it simple, we've broken down all of those vehicle choices into 
    nine major categories covering all of the basic types of vehicles from coupes to full-size sedans to crossover SUVs.
    The easiest way to define a vehicle is by how it looks. What's the first thing you notice when a vehicle comes toward you on the street? 
    Its shape. That's called the 
    \"body style.\" Is it tall and boxy? Low and sleek? How many doors does it have? Body style is the easiest way to categorize a vehicle.",

    "Wagons are similar to sedans but have an extended roofline and a hatch door at the rear instead of a trunk. 
    Some, like the Subaru Outback or Audi A4 Allroad, have elevated ground clearance and some rugged body cladding to make 
    them more like a sport-utility vehicle (SUV), but they are nonetheless closely related to sedans. 
    Wagons have fallen from favor during the past few decades and there are relatively few available for sale in the United States.",

    "Traditionally, the term \"hatchback\" has meant a compact or subcompact sedan with a squared-off roof and a rear 
    flip-up hatch door that provides access to the vehicle's cargo area instead of a conventional trunk. The Volkswagen Golf and Kia Rio 
    are two typical hatchbacks. More recently, rear hatches have found their way on to some larger cars, like the Audi A7 and Kia Stinger. 
    They look like sedans, but they actually have a steeply 
    raked hatchback that affords easier accessibility to the cargo area and greater carrying capacity than a traditional trunk would.",

    "Does the roof retract into the body leaving the passenger cabin open to the elements? 
    If so, it's a convertible. Most convertibles have a fully powered fabric roof that folds down, 
    but a few have to be lowered by hand. There are also a number of models with a retractable hardtop, 
    as well as several unusual quasi-convertibles (called \"targa tops\") like the Mazda MX-5 Miata RF,
     Porsche 911 Targa and Corvette; only the forward section of their roofs retracts or can be removed by hand."
]
prices = [100, 200, 10000, 100000, 1234, 6, 60, 123214]
(1..100).each do |n|
    Product.create(
        title: titles.sample,
        campaign_id: 1,
        description: descriptions.sample,
        short_description: descriptions.sample[0..descriptions.sample.length/2],
        price: prices.sample,
        quantity: prices.sample/2
    )
    Order.create(
            product_name: Product.last.title,
            buyer_id: 1,
            seller_id: 1,
            product_id: 1,
            seller_name: 'Seller',
            price: Product.last.price,
            delivery_adress: 'New York, best stret',
            paid: [0, 1].sample      
    )
end

# Status.create(status_name: 'Pending')
# Status.create(status_name: 'Awaiting Payment')
# Status.create(status_name: 'Awaiting Shipment')
# Status.create(status_name: 'Awaiting Pickup')
# Status.create(status_name: 'Partially Shipped')
# Status.create(status_name: 'Complited')
# Status.create(status_name: 'Shipped')
# Status.create(status_name: 'Cancelled')
# Status.create(status_name: 'Refunded')

