sv = Map.create(name: "Silicon Valley", latLng: "37.57, -122.26", zoom: 10)

sv.listings.create(name: Faker::Company.name, latLng: "37.7, -122.41")
sv.listings.create(name: Faker::Company.name, latLng: "37.59, -122.39")
sv.listings.create(name: Faker::Company.name, latLng: "37.52, -122.29")
sv.listings.create(name: Faker::Company.name, latLng: "37.37, -122.12")
sv.listings.create(name: Faker::Company.name, latLng: "37.36, -121.94")

dubai = Map.create(name: "Dubai", latLng: "25.26, 55.25", zoom: 12)

dubai.listings.create(name: Faker::Company.name, latLng: "25.26, 55.39")
dubai.listings.create(name: Faker::Company.name, latLng: "25.22, 55.38")
dubai.listings.create(name: Faker::Company.name, latLng: "25.25, 55.33")
dubai.listings.create(name: Faker::Company.name, latLng: "25.23, 55.17")
dubai.listings.create(name: Faker::Company.name, latLng: "25.24, 55.25")
