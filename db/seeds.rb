seaOrg = Organization.create(name: 'Sea Org')
superAdmin = seaOrg.users.create(role: 'super-admin', email: 'admin@seaorg.com', password: 'password')

3.times do
  org = Organization.create(name: Faker::Space.constellation)
  puts org.name
  rand(2..4).times do
    pool = org.pools.create(name: Faker::Ancient.god)
    puts pool.name
    rand(4..7).times do
      lane = pool.lanes.create(name: Faker::Book.title)
      rand(0..10).times do
        lane.tickets.create(pool_id: pool.id, organization_id: org.id, nickname: Faker::DragonBall.character, email: Faker::Internet.email)
      end
    end
  end
end

# Amityville
puts 'Amityville'
org = Organization.create(name: 'Amityville')
org.users.create(role: 'admin', email: 'user@example.com', password: 'password')
pool = org.pools.create(name: 'Business License')
laneBank = ['Application Received',
            'Examination',
            '2nd Review',
            'Completed']
laneBank.each { |name| pool.lanes.create(name: name) }
pool.lanes.each do |lane|
  rand(2..10).times do
    lane.tickets.create(pool_id: pool.id, organization_id: org.id, nickname: Faker::DragonBall.character, email: Faker::Internet.email)
  end
end
