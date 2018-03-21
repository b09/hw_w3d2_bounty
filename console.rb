require_relative('bounty')

bounty1 = {'name' => 'Vicious', 'species' => 'Human', 'bounty_value' => 10334594, 'homeworld' => 'Mars'}
bounty1obj = Bounty.new(bounty1)

bounty2 = {'name' => 'Lin', 'species' => 'Human', 'bounty_value' => 103343, 'homeworld' => 'Mars'}
bounty2obj = Bounty.new(bounty2)

bounty3 = {'name' => 'Shin', 'species' => 'Android', 'bounty_value' => 459483, 'homeworld' => 'Earth'}
bounty3obj = Bounty.new(bounty3)

bounty4 = {'name' => 'Laughing Bull', 'species' => 'Android', 'bounty_value' => 10343, 'homeworld' => 'Mars'}
bounty4obj = Bounty.new(bounty4)

bounty5 = {'name' => 'Chessmaster Hex', 'species' => 'Human', 'bounty_value' => 59483, 'homeworld' => 'Earth'}
bounty5obj = Bounty.new(bounty5)


bounty1obj.save()
bounty2obj.save()
bounty3obj.save()
bounty4obj.save()
bounty5obj.save()
# all_bounties = Bounty.all()
# p all_bounties
p bounty5obj
puts ""
p bounty4obj
puts ""
p bounty3obj
