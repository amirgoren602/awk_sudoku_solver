{
  for (i = 1; i <= NF; i++)
    puzzle[NR, i] = $i
}

END {
  initSubgrids()
  validatePuzzle(puzzle)
  main(puzzle)
}

function initSubgrids() {
  subgrids[1, 1] = "1" SUBSEP "1"
  subgrids[1, 2] = "1" SUBSEP "1"
  subgrids[1, 3] = "1" SUBSEP "1"
  subgrids[2, 1] = "1" SUBSEP "1"
  subgrids[2, 2] = "1" SUBSEP "1"
  subgrids[2, 3] = "1" SUBSEP "1"
  subgrids[3, 1] = "1" SUBSEP "1"
  subgrids[3, 2] = "1" SUBSEP "1"
  subgrids[3, 3] = "1" SUBSEP "1"
 
  subgrids[1, 4] = "1" SUBSEP "4"
  subgrids[1, 5] = "1" SUBSEP "4"
  subgrids[1, 6] = "1" SUBSEP "4"
  subgrids[2, 4] = "1" SUBSEP "4"
  subgrids[2, 5] = "1" SUBSEP "4"
  subgrids[2, 6] = "1" SUBSEP "4"
  subgrids[3, 4] = "1" SUBSEP "4"
  subgrids[3, 4] = "1" SUBSEP "4"
  subgrids[3, 6] = "1" SUBSEP "4"

  subgrids[1, 7] = "1" SUBSEP "7"
  subgrids[1, 8] = "1" SUBSEP "7"
  subgrids[1, 9] = "1" SUBSEP "7"
  subgrids[2, 7] = "1" SUBSEP "7"
  subgrids[2, 8] = "1" SUBSEP "7"
  subgrids[2, 9] = "1" SUBSEP "7"
  subgrids[3, 7] = "1" SUBSEP "7"
  subgrids[3, 8] = "1" SUBSEP "7"
  subgrids[3, 9] = "1" SUBSEP "7"

  subgrids[4, 1] = "4" SUBSEP "1"
  subgrids[4, 2] = "4" SUBSEP "1"
  subgrids[4, 3] = "4" SUBSEP "1"
  subgrids[5, 1] = "4" SUBSEP "1"
  subgrids[5, 2] = "4" SUBSEP "1"
  subgrids[5, 3] = "4" SUBSEP "1"
  subgrids[6, 1] = "4" SUBSEP "1"
  subgrids[6, 2] = "4" SUBSEP "1"
  subgrids[6, 3] = "4" SUBSEP "1"

  subgrids[4, 4] = "4" SUBSEP "4"
  subgrids[4, 5] = "4" SUBSEP "4"
  subgrids[4, 6] = "4" SUBSEP "4"
  subgrids[5, 4] = "4" SUBSEP "4"
  subgrids[5, 5] = "4" SUBSEP "4"
  subgrids[5, 6] = "4" SUBSEP "4"
  subgrids[6, 4] = "4" SUBSEP "4"
  subgrids[6, 5] = "4" SUBSEP "4"
  subgrids[6, 6] = "4" SUBSEP "4"

  subgrids[4, 7] = "4" SUBSEP "7"
  subgrids[4, 8] = "4" SUBSEP "7"
  subgrids[4, 9] = "4" SUBSEP "7"
  subgrids[5, 7] = "4" SUBSEP "7"
  subgrids[5, 8] = "4" SUBSEP "7"
  subgrids[5, 9] = "4" SUBSEP "7"
  subgrids[6, 7] = "4" SUBSEP "7"
  subgrids[6, 8] = "4" SUBSEP "7"
  subgrids[6, 9] = "4" SUBSEP "7"

  subgrids[7, 1] = "7" SUBSEP "1"
  subgrids[7, 2] = "7" SUBSEP "1"
  subgrids[7, 3] = "7" SUBSEP "1"
  subgrids[8, 1] = "7" SUBSEP "1"
  subgrids[8, 2] = "7" SUBSEP "1"
  subgrids[8, 3] = "7" SUBSEP "1"
  subgrids[9, 1] = "7" SUBSEP "1"
  subgrids[9, 2] = "7" SUBSEP "1"
  subgrids[9, 3] = "7" SUBSEP "1"

  subgrids[7, 4] = "7" SUBSEP "4"
  subgrids[7, 5] = "7" SUBSEP "4"
  subgrids[7, 6] = "7" SUBSEP "4"
  subgrids[8, 4] = "7" SUBSEP "4"
  subgrids[8, 5] = "7" SUBSEP "4"
  subgrids[8, 6] = "7" SUBSEP "4"
  subgrids[8, 7] = "7" SUBSEP "4"
  subgrids[8, 8] = "7" SUBSEP "4"
  subgrids[8, 9] = "7" SUBSEP "4"

  subgrids[7, 7] = "7" SUBSEP "7"
  subgrids[7, 8] = "7" SUBSEP "7"
  subgrids[7, 9] = "7" SUBSEP "7"
  subgrids[8, 7] = "7" SUBSEP "7"
  subgrids[8, 8] = "7" SUBSEP "7"
  subgrids[8, 9] = "7" SUBSEP "7"
  subgrids[9, 7] = "7" SUBSEP "7"
  subgrids[9, 8] = "7" SUBSEP "7"
  subgrids[9, 9] = "7" SUBSEP "7" 
}

function count(arr,   key, i) {
  for (key in arr) i++
  return i
}

function main(puzzle) {
  if (solve(puzzle) == -1)
    exitWithError("Unsolvable puzzle")
  else
    printPuzzle(puzzle)
}

function printPuzzle(puuzle,   i, j) {
  for (i = 1; i <= 9; i++) {
    for (j = 1; j <= 9; j++)
      printf("%s ", puuzle[i, j])
    printf("\n")  
  }
}

function solve(puzzle,   rowAndColStr, rowAndCol, row, col, i, solved) {
  if (! haveZeros(puzzle)) {
    return 1
  }
  rowAndColStr = getZeroIndices(puzzle)
  split(rowAndColStr, rowAndCol, SUBSEP)
  row = rowAndCol[1]
  col = rowAndCol[2]
  for (i = 1; i <= 9; i++) {
  	puzzle[row, col] = i
  	if (isRowHaveDuplicates(puzzle, row) || isColumnHaveDuplicates(puzzle, col) || isSubgridHaveDuplicates(puzzle, subgrids[row, col])) 
  	  continue
    solved = solve(puzzle)
    if (solved == -1) 
      continue
    return solved
  }
  puzzle[row, col] = 0
  return -1
}

function haveZeros(puzzle,   i, j) {
  for (i = 1; i <= 9; i++) 
    for (j = 1; j <= 9; j++)
      if (puzzle[i, j] == 0)
        return 1
  return 0
}

function getZeroIndices(puzzle,   i, j) {
  for (i = 1; i <= 9; i++)
    for (j = 1; j <= 9; j++)
      if (puzzle[i, j] == 0)
        return (i SUBSEP j)
}

function validatePuzzle(puzzle) {
  validateNineRowsAndCols(puzzle)
  validateRows(puzzle)
  validateColumns(puzzle)
  validateSubgrids(puzzle)
}

function exitWithError(message) {
  print message | "cat 1&>2"
  exit(1)
}

function validateNineRowsAndCols(puzzle,   key, rowAndCol, row, col, rows) {
  for (key in puzzle) {
  	split(key, rowAndCol, SUBSEP)
  	row = rowAndCol[1]
  	col = rowAndCol[2]
  	rows[row]++
  }

  if (count(rows) != 9) 
  	exitWithError("Invalid puzzle")

  for (key in rows)
  	if (rows[key] != 9)
  	  exitWithError("Invalid puzzle")
}

function isRowHaveDuplicates(puzzle, i,   key, rowAndCol, row, arr) {
  for (key in puzzle) {
  	split(key, rowAndCol, SUBSEP)
  	row = rowAndCol[1]
  	if (row == i && puzzle[key] != 0) {
  		if (puzzle[key] in arr)
  		  return 1
		  else
		    arr[puzzle[key]] = 1
  	} 
  }
  return 0
}

function isColumnHaveDuplicates(puzzle, i,   key, rowAndCol, col, arr) {
  for (key in puzzle) {
  	split(key, rowAndCol, SUBSEP)
  	col = rowAndCol[2]
  	if (col == i && puzzle[key] != 0) {
      if (puzzle[key] in arr) 
        return 1
      else
        arr[puzzle[key]] = 1
  	}
  }
  return 0
}

function isSubgridHaveDuplicates(puzzle, key,   rowAndCol, row, col, list, i, arr) {
  split(key, rowAndCol, SUBSEP)
  row = rowAndCol[1]
  col = rowAndCol[2]

  list[1] = row SUBSEP col
  list[2] = row SUBSEP (col + 1)
  list[3] = row SUBSEP (col + 2)
  list[4] = (row + 1) SUBSEP col
  list[5] = (row + 1) SUBSEP (col + 1)
  list[6] = (row + 1) SUBSEP (col + 2)
  list[7] = (row + 2) SUBSEP col
  list[8] = (row + 2) SUBSEP (col + 1)
  list[9] = (row + 2) SUBSEP (col + 2)

  for (i in list) {
  	if (puzzle[list[i]] != 0) {
	  if (puzzle[list[i]] in arr) 
	    return 1
	  else
	    arr[puzzle[list[i]]] = 1
  	} 
  }

  return 0
}

function validateRows(puzzle,   i) {
  for (i = 1; i <= 9; i++)
    if (isRowHaveDuplicates(puzzle, i))
      exitWithError("Invalid puzzle")
}

function validateColumns(puzzle,   j) {
  for (j = 1; j <= 9; j++) 
    if (isColumnHaveDuplicates(puzzle, j))
      exitWithError("Invalid puzzle")
}

function validateSubgrids(puzzle) {
  if (isSubgridHaveDuplicates(puzzle, 1 SUBSEP 1) ||
    isSubgridHaveDuplicates(puzzle, 1 SUBSEP 4) ||
    isSubgridHaveDuplicates(puzzle, 1 SUBSEP 7) ||
    isSubgridHaveDuplicates(puzzle, 4 SUBSEP 1) ||
    isSubgridHaveDuplicates(puzzle, 4 SUBSEP 4) ||
    isSubgridHaveDuplicates(puzzle, 4 SUBSEP 7) ||
    isSubgridHaveDuplicates(puzzle, 7 SUBSEP 1) ||
    isSubgridHaveDuplicates(puzzle, 7 SUBSEP 4) ||
    isSubgridHaveDuplicates(puzzle, 7 SUBSEP 7)) {
  	exitWithError("Invalid puzzle")
  }
}