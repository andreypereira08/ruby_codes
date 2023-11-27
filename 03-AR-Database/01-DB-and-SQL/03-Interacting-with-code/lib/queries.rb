require "sqlite3"
def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  # Should return an integer of the number of artists.
  return db.execute("SELECT COUNT(*) FROM artists").join.to_i
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
  return db.execute("SELECT COUNT(*) FROM #{table_name}").join.to_i
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
  return db.execute("SELECT name FROM artists ORDER BY name ASC").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
  result = db.execute("SELECT * FROM tracks WHERE name LIKE '%love%' ORDER BY name")
  array = []
  result.each do |element|
    name_music = element[4]
    array << name_music
  end
  return array
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
  min_length *= 6 * (10**4)
  return 0 if db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length} ORDER BY milliseconds ASC").empty?
  return db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length} ORDER BY milliseconds ASC").flatten
end

def albums_per_artist(db)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
return db.execute("SELECT artists.name, COUNT(*) FROM albums JOIN artists ON albums.artist_id = artists.id GROUP BY artists.name")
end