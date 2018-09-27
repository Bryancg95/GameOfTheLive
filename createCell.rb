require "./GameLiveStar.rb"
class Createcell < GameLiveStar

  def initialize (size,cellsLive)
    @cellsPCre = Array.new(size){Array.new(size)}
    @cellsLive = cellsLive
  end

  def create_living_cells(cellsLive, cellsP)
      @cellsPCre = cellsP
      @cellsPCre = clearn_cells(cellsP)

      (0...cellsLive).each { |i|
        @cellsPCre[rand(0...cellsP.length)][rand(0...cellsP.length)] = 1 }
      return @cellsPCre
  end


  def clearn_cells(cellsP)
      (0...cellsP.length).each { |r|
      (0...cellsP.length).each { |c|
         @cellsPCre[r][c] = 0   }}
         return @cellsPCre
  end


end
