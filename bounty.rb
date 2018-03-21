require('pg')

class Bounty

attr_accessor :name, :species, :bounty_value, :homeworld
attr_reader :id

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
    @id = options['id']
  end

  def save

    bountydb = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    INSERT INTO bounties
      (name, species, bounty_value, homeworld)
      VALUES
      ($1,$2,$3,$4)
      ;
    "
    values = [@name, @species, @bounty_value, @homeworld]

    bountydb.prepare("save", sql)
    bountydb.exec_prepared("save", values)

    bountydb.close()
  end

  def update

    bountydb = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    UPDATE bounties
      SET (name, species, bounty_value, homeworld) =
      ($1,$2,$3,$4)
      WHERE id = $5
      ;
    "
    values = [@name, @species, @bounty_value, @homeworld, @id]

    bountydb.prepare("update", sql)
    bountydb.exec_prepared("update", values)

    bountydb.close()

  end

  def Bounty.all
    bountydb = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    SELECT * FROM bounties ORDER BY name;
    "

    bountydb.prepare("get_all", sql)
    all_bounties = bountydb.exec_prepared("get_all")

    bountydb.close()

    indv_bounty_obj = all_bounties.map { |bounty| Bounty.new(bounty) }

    return puts indv_bounty_obj
  end

end
