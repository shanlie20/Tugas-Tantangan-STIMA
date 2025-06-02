puts "------------------------------------------------"
puts "| Program TSP Dynamic Programming (Held-Karp)  |" 
puts "------------------------------------------------"

puts "Pilih metode input matriks ketetanggaan:"
puts "1. Dari file TXT"
puts "2. Dari terminal (input manual)"
print "Pilihan Anda (1/2): "
input_choice = gets.chomp

adj_matrix = []
num_cities = 0

begin
  case input_choice
  when "1"
    puts "\nMasukkan path lengkap file matriks ketetanggaan (misal: test/test1.txt):"
    input_filename = gets.chomp

    File.foreach(input_filename) do |line|
      row = line.split.map do |val_str|
        val = val_str.to_i
        val == 999999 ? Float::INFINITY : val
      end
      adj_matrix << row
    end
    num_cities = adj_matrix.length

  when "2"
    print "\nMasukkan jumlah kota (n): "
    num_cities = gets.chomp.to_i

    if num_cities <= 1
      raise "Jumlah kota harus lebih dari 1 untuk TSP."
    end

    puts "Masukkan matriks ketetanggaan (baris per baris)."
    puts "Pisahkan nilai dengan spasi yaaa."
    puts "Gunakan 'INF' atau 999999 untuk jarak tak terbatas."

    (0...num_cities).each do |i|
      row_input = gets.chomp.split.map do |val_str|
        if val_str.upcase == "INF"
          Float::INFINITY
        else
          val = val_str.to_i
          val == 999999 ? Float::INFINITY : val
        end
      end

      if row_input.length != num_cities
        raise "Jumlah kolom di baris #{i + 1} tidak sesuai dengan jumlah kota (#{num_cities})."
      end

      adj_matrix << row_input
    end

  else
    raise "Pilihan tidak valid. Harap pilih 1 atau 2."
  end

  if adj_matrix.empty? || adj_matrix.length != num_cities || adj_matrix.any? { |r| r.length != num_cities }
    raise "Matriks tidak valid."
  end

  puts "\nMatriks Ketetanggaan:"
  max_width = adj_matrix.flatten.map { |val| (val == Float::INFINITY ? "INF" : val.to_s).length }.max
  adj_matrix.each do |row|
    puts row.map { |val| (val == Float::INFINITY ? "INF" : val.to_s).rjust(max_width) }.join(" ")
  end

  start = 0
  dp = Array.new(1 << num_cities) { Array.new(num_cities, Float::INFINITY) }
  path_tracker = Array.new(1 << num_cities) { Array.new(num_cities, nil) }
  dp[1 << start][start] = 0

  (1...(1 << num_cities)).each do |mask|
    (0...num_cities).each do |u|
      next if (mask & (1 << u)) == 0
      prev_mask = mask ^ (1 << u)
      next if prev_mask == 0

      (0...num_cities).each do |v|
        next if (prev_mask & (1 << v)) == 0
        next if adj_matrix[v][u] == Float::INFINITY

        cost = dp[prev_mask][v] + adj_matrix[v][u]
        if cost < dp[mask][u]
          dp[mask][u] = cost
          path_tracker[mask][u] = v
        end
      end
    end
  end

  full_mask = (1 << num_cities) - 1
  min_cost = Float::INFINITY
  last_city = nil

  (0...num_cities).each do |i|
    next if i == start || adj_matrix[i][start] == Float::INFINITY
    total_cost = dp[full_mask][i] + adj_matrix[i][start]
    if total_cost < min_cost
      min_cost = total_cost
      last_city = i
    end
  end

  if min_cost == Float::INFINITY
    puts "\nTidak ada rute/tur yang valid ditemukan. Kemungkinan graf tidak terhubung."
  else
    path = [start]
    mask = full_mask
    current = last_city

    while current != start
      path << current
      prev = path_tracker[mask][current]
      mask ^= (1 << current)
      current = prev
    end
    path << start
    path.reverse!

    puts "\nJarak terpendek: #{min_cost}"
    rute_output = []
    (0...path.size - 1).each do |i|
      from = path[i]
      to = path[i + 1]
      cost = adj_matrix[from][to]
      rute_output << "#{from + 1} (#{cost})"
    end
    rute_output << "#{path.last + 1}"
    puts "Rute/Tur terpendek: " + rute_output.join(" -> ")
  end

rescue => e
  puts "\nTerjadi kesalahan: #{e.message}"
end
