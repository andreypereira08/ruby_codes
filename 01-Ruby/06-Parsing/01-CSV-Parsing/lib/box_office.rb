require 'csv'
def most_successful(number, max_year, file_path)
  # TODO: return an array of most successful movies before `max_year`
  result = []
  CSV.foreach(file_path) do |row|
    result << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end
  result = result.select { |element| element[:year] < max_year } 
  result = result.sort_by { |element| -element[:earnings] }
  result = result.take(number)

  return result
end

