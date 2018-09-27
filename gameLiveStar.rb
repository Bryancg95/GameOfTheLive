class GameLiveStar

  def show_cells(cellsP)
      (0...cellsP.length).each { |r|
        cellshow = ""
      (0...cellsP.length).each { |c|
        cellshow = (cellsP[r][c] == 1) ? "#{cellshow.to_s}°" : "#{cellshow.to_s} "}
      puts cellshow.to_s }
  end

end
