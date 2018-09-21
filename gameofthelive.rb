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
      for i in 0...cellsLive
        @cellsP[rand(0...@size)][rand(0...@size)] = 1
      end
  end


  def clearn_cells
      for r in 0...@cellsP.length
        for c in 0...@cellsP.length
          @cellsP[r][c] = 0
        end
      end
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
     for r in 0...cellsP.length
       for c in 0...cellsP.length
         if cellsP[r][c] == 1
           @rowCL[countCL] = r
           @columnCL[countCL] = c
           countCL = countCL + 1
         else
           @rowCD[countCD] = r
           @columnCD[countCD] = c
           countCD = countCD + 1
         end
       end
     end
     pass_cells_primary
     rules_living_cells(countCL)
     rules_dead_cells(countCD)
     pass_cells_secondary
     puts "#{countCL.to_s}"
     return true if countCL >= 1

  end


  def rules_living_cells(countCL)
    for c in 0...countCL

      rows = -1
      rows2 = 1
      livecells = 0
      if @rowCL[c] == 0
        rows = 0
      else
       if @rowCL[c] == @size - 1
        rows2 = 0
       end
      end

      for c2 in rows..rows2
          column = -1
          column2 = 1

          if @columnCL[c] == 0
            column = 0
          else
            if @columnCL[c] == (@size - 1)
             column2 = 0
            end
          end

          for c3 in column..column2
            if @cellsP[@rowCL[c]+c2][@columnCL[c]+c3] == 1
              livecells = livecells + 1
            end
          end
      end
      puts "#{livecells.to_s}"
      if (livecells-1) == 2 || (livecells-1) == 3
        @cellsS[@rowCL[c]][@columnCL[c]] = 1
      else
        @cellsS[@rowCL[c]][@columnCL[c]] = 0
      end
    end
  end


  def rules_dead_cells(countCD)
    for c in 0...countCD
      rows = -1
      rows2 = 1
      livecells = 0

      if @rowCD[c] == 0
        rows = 0
      else

       if @rowCD[c] == @size - 1
        rows2 = 0
       end

      end

      for c2 in rows..rows2
          column = -1
          column2 = 1

          if @columnCD[c] == 0
            column = 0
          else
            if @columnCD[c] == (@size - 1)
             column2 = 0
            end
          end

          for c3 in column..column2
            if @cellsP[@rowCD[c]+c2][@columnCD[c]+c3] == 1
              livecells = livecells + 1
            end
          end
      end

      if livecells == 3
        @cellsS[@rowCD[c]][@columnCD[c]] = 1
      end
    end

  end

  def show_cells(cellsP = @cellsP)

      (0...cellsP.length).each { |r|
        cellshow = ""
      (0...cellsP.length).each { |c|
        if cellsP[r][c] == 1
          cellshow = "#{cellshow.to_s}°"
        else
          cellshow = "#{cellshow.to_s}*"
        end}
      puts cellshow.to_s }
  end
end
game = Gameofthelive.new
game.start
