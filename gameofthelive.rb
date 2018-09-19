class Gameofthelive
  
  def initialize(size = 10,cellsLive = 10)
    @cellsP = Array.new(size){Array.new(size)}
    @cellsS = @boardP
    @size = size
    @rowCL = Array.new(size)
    @columnCL = Array.new(size)
    @rowCD = Array.new(size)
    @columnCD = Array.new(size)
    @cells = 1
    @cellsLive = cellsLive
  end


  def create_living_cells(cellsLive = @cellsLive, cellsP = @cellsP, size = @size)
      clearn_cells
      for i in 0...cellsLive
        cellsP[rand(0...size)][rand(0...size)] = 1
      end
  end


  def clearn_cells(cellsP = @cellsP)
      for r in 0...cellsp.length
        for c in 0...cellsp.length
          cellsP[r][c] = 0
        end
      end
  end


  def pass_cells_primary(cellsP = @cellsP, cellsS = @cellsS)
      cellsS = cellsP
  end

  def pass_cells_secondary(cellsP = @cellsP, cellsS = @cellsS)
      cellsP = cellsS
  end


  def search_cells(cellsP = @cellsP)
     countCL = 0
     countCD = 0
     for r in 0...cellsP
       for c in 0...cellsP
         if cellsP[r][c] == 1
           @rowCL[countCL] = r
           @columnCL[countCL] = r
           countCL = countCL + 1
         else
           @rowCD[countCD] = r
           @columnCD[countCD] = r
           countCD = countCD + 1
         end
       end
     end
     pass_cells_primary
     rules_living_cells(countCL)
     rules_dead_cells(countCD)
     pass_cells_secondary
  end


  def rules_living_cells(countCL )
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

      for c2 in rows...rows2
          column = -1
          column2 = 1

          if @columnCL[c] == 0
            column = 0
          else
            if @columnCL[c] == @size - 1
             column2 = 0
            end
          end

          for c3 in column...column2
            if @cellsP[@rowCL[c]+c2][@columnCL[c]+c3] == 1
              livecells = livecells + 1
            end
          end
      end

      if livecells-1 == 2 || livecells-1 == 3
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

      for c2 in rows...rows2
          column = -1
          column2 = 1

          if @columnCD[c] == 0
            column = 0
          else
            if @columnCD[c] == @size - 1
             column2 = 0
            end
          end

          for c3 in column...column2
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
end
