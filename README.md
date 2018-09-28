<header class=text-center>

# Game of the live

![](https://i.imgur.com/YRzy8bu.jpg)




</header>


<section class=text-justify>

## Introduction



The game of life is a cellular automaton designed by the British mathematician John Horton Conway in 1970.

He made his first public appearance in the October 1970 issue of Scientific American, in the math games column of Martin Gardner. From a theoretical point of view, it is interesting because it is equivalent to a universal Turing machine, that is, everything that can be computed algorithmically can be computed in the game of life.

## The game

![](https://i.imgur.com/47sSVS2.gif)


It is a zero-player game, which means that its evolution is determined by the initial state and does not require any subsequent data entry. The "game board" is a flat mesh formed by squares (the "cells") that extends across infinity in all directions. Therefore, each cell has 8 "neighboring" cells, which are those that are close to it, including the diagonals. Cells have two states: they are "alive" or "dead" (or "on" and "off"). The state of the cells evolves along discrete time units (one might say that in turns). The state of all the cells is taken into account to calculate the state of the cells on the following turn. All the cells are updated simultaneously in each shift, following these rules:

A dead cell with exactly 3 living neighboring cells is "born" (that is, the next turn will be alive).
A living cell with 2 or 3 neighboring living cells is still alive, otherwise it dies (due to "loneliness" or "overpopulation").

</section>

<section class=text-justify>

## How to install

First you have to clone the repository


<pre><code>git clone https://github.com/Bryancg95/GameOfTheLive.git</code></pre>

To use it you need to add it to the project

<pre><code>require "gameofthelive.rb"</code></pre>


</section>

## Functions


To initialize the class you have to put

<pre><code>new_gameofthelive = Gameofthelive.new(size,cellsLive) </code></pre>


>The 'size' is the size of the board and cellsLive the cells that will start with life

If you want to execute the game in the console, you use

<pre><code>start</code></pre>


To prepare the board is used


<pre><code>create_living_cells(cellsLive,board_Primary)</code></pre>

>The board_Primary is to fill the board with the cells that will be alive is a 2-dimensional array



If cleaning the board is required, the following function is used


<pre><code>clearn_cells(board_Primary)</code></pre>



To be able to show the board the following function is used

<pre><code>show_cells(board_Primary)</code></pre>

To look for live and dead cells the function is used

<pre><code>search_cells(board_Primary,board_secondary)</code></pre>

>The secondary board is used to empty make the changes of the states of the cells before overwriting in the primary

To determine if living cells continue to live or die is used

<pre><code>rules_living_cells(count_Cells_dead)</code></pre>

>This function uses the live cells that were found in "search_cells"

To determine if dead cells continue to die or live is used

<pre><code>rules_dead_cells(count_Cells_Live)</code></pre>

>This function uses the dead cells that were found in "search_cells"

To verify if the cell has to die is used

<pre><code>rules_kill_live_cell(livecells)</code></pre>

>The variable that is sent is the living cells around the cell that you want to know if you live or die, this function goes hand in hand with the "rules_dead_cells"
