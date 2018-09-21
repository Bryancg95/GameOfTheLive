class Gameofthelive

  def initialize(size = 10,cellsLive = 20)
    @cellsP = Array.new(size){Array.new(size)}
    @cellsS = @cellsP
    @size = size
    @rowCL = Array.new(size)
    @columnCL = Array.new(size)
    @rowCD = Array.new(size)
    @columnCD = Array.new(size)
    @cells = 1
    @cellsLive = cellsLive
  end

  def method_missing(m, *args)
      puts "There is no method with the name #{m}"
  end

  def start
    existCells = true
    create_living_cells
    show_cells
    while existCells == true
      existCells = search_cells
      puts ""
      show_cells
      sleep 4
    end
  end

  def create_living_cells(cellsLive = @cellsLive)
      clearn_cells
      (0...cellsLive).each { |i|
        @cellsP[rand(0...@size)][rand(0...@size)] = 1 }
  end


  def clearn_cells
      (0...@cellsP.length).each { |r|
      (0...@cellsP.length).each { |c|
         @cellsP[r][c] = 0   }}
  end


  def pass_cells_primary
      @cellsS = @cellsP
  end

  def pass_cells_secondary
      @cellsP = @cellsS
  end


  def search_cells(cellsP = @cellsP)
     countCL = 0
     countCD = 0

     (0...cellsP.length).each { |r|
     (0...cellsP.length).each { |c|
       if cellsP[r][c] == 1
         @rowCL[countCL] = r
         @columnCL[countCL] = c
         countCL = countCL + 1
       else
         @rowCD[countCD] = r
         @columnCD[countCD] = c
         countCD = countCD + 1
       end }}

     pass_cells_primary
     rules_living_cells(countCL)
     rules_dead_cells(countCD)
     pass_cells_secondary
     return true if countCL >= 1

  end


  def rules_living_cells(countCL)

    (0...countCL).each do |c|
      rows = -1
      rows2 = 1
      column = -1
      column2 = 1
      livecells = 0

      if @rowCL[c] == 0
        rows = 0
      else
       if @rowCL[c] == (@size - 1)
        rows2 = 0
       end
      end

      if @columnCL[c] == 0
        column = 0
      else
        if @columnCL[c] == (@size - 1)
         column2 = 0
        end
      end


      (rows..rows2).each { |c2|
      (column..column2).each { |c3|
        if @cellsP[@rowCL[c]+c2][@columnCL[c]+c3] == 1
          livecells = livecells + 1
        end}}

    @cellsS[@rowCL[c]][@columnCL[c]] =  rules_kill_live_cell(livecells)

    end
  end

def rules_kill_live_cell(livecells)
    return ( (livecells-1) == 2 || (livecells-1) == 3) ? 1 : 0
end

  def rules_dead_cells(countCD)
    for c in 0...countCD
      rows = -1
      rows2 = 1
      column = -1
      column2 = 1
      livecells = 0

      if @rowCD[c] == 0
        rows = 0
      else
       if @rowCD[c] == @size - 1
        rows2 = 0
       end
      end

      if @columnCD[c] == 0
        column = 0
      else
        if @columnCD[c] == (@size - 1)
         column2 = 0
        end
      end

      (rows..rows2).each { |c2|
      (column..column2).each { |c3|
        if @cellsP[@rowCD[c]+c2][@columnCD[c]+c3] == 1
          livecells = livecells + 1
        end}}

        @cellsS[@rowCD[c]][@columnCD[c]] = revive_dead_cell(livecells)

    end
  end

def revive_dead_cell(livecells)
   return if (livecells == 3)
     1
end

  def show_cells(cellsP = @cellsP)

      (0...cellsP.length).each { |r|
        cellshow = ""
      (0...cellsP.length).each { |c|
        cellshow = (cellsP[r][c] == 1) ? "#{cellshow.to_s}°" : "#{cellshow.to_s}*"}
      puts cellshow.to_s }

  end
end
game = Gameofthelive.new
game.start
