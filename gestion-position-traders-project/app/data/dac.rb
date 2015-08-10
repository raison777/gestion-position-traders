class Dac
  @connection = ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => 'db/development.sqlite3'
  )

  def self.execute_query(query, *args)
    @result = @connection.connection.execute(query, args);
  end
end