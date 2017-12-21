seaOrg = Organization.create(name: 'Sea Org')
superAdmin = seaOrg.users.create(role: 'super-admin', email: 'admin@seaorg.com', password: 'password')

3.times do
  org = Organization.create(name: Faker::Space.constellation)
  puts org.name
  rand(2..4).times do
    pool = org.pools.create(name: Faker::HarryPotter.location)
    puts pool.name
    rand(4..7).times do
      lane = pool.lanes.create(name: Faker::LordOfTheRings.location)
      rand(0..10).times do
        lane.tickets.create(pool_id: pool.id, nickname: Faker::DragonBall.character)
      end
    end
  end
end

# Centerville
org = Organization.create(name: 'Centerville')
puts org.name
pool = org.pools.create(name: 'Business License')
puts pool.name
lane = pool.lanes.create(name: 'Application Received')
lane = pool.lanes.create(name: 'Examination')
lane = pool.lanes.create(name: '2nd Review')
lane = pool.lanes.create(name: 'Completed')
pool.lanes.each do |lane|
  rand(2..10).times do
    lane.tickets.create(pool_id: pool.id, nickname: Faker::DragonBall.character)
  end
end