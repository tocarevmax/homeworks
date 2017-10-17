require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT *
      FROM plays
      WHERE title = ?
      SQL
  end

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT title
      FROM plays
      JOIN playwrights
        ON plays.playwright_id = playwrights.ID
      WHERE
        playwrights.name = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

    # Playwright::all
  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT *
      FROM playwrights
    SQL
    data.map do |datum|
      Playwright.new(datum)
    end
  end

    # Playwright::find_by_name(name)
  def self.find_by_name(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT title
      FROM playwrights
      JOIN plays
        ON plays.playwright_id = playwrights.id
      WHERE name = ?
    SQL
  end

    # Playwright#new (this is the initialize method)
  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @birth_year = options["birth_year"]
  end

    # Playwright#create
  def create
    raise "ID already exists" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

    # Playwright#update
  def update
    raise "ID doesn't exist" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE playwrights
      SET name = ?,
          birth_year = ?
      WHERE
          id = ?
    SQL
  end

    # Playwright#get_plays (returns all plays written by playwright)
  def get_plays
    p PlayDBConnection.instance.execute(<<-SQL, @name)
      SELECT title
      FROM playwrights
      JOIN plays
        ON plays.playwright_id = playwrights.id
      WHERE
        name = ?
    SQL
  end


end
