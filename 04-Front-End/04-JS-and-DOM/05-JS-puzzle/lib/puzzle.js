// Select all the tiles
const tiles = document.querySelectorAll('td');

const canMove = (tile) => {
  // TODO: Check if a tile has an empty neighbour
  const tilesEmpty = document.querySelector(".empty");
  const emptyColumn = tilesEmpty.cellIndex;
  const emptyRow = tilesEmpty.parentElement.rowIndex;
  const tileColumn = tile.cellIndex;
  const tileRow = tile.parentElement.rowIndex;

  let result = false;
  if (tileColumn + 1 === emptyColumn) {
    result = true;
  } else if (tileColumn - 1 === emptyColumn) {
    result = true;
  } else if (tileRow + 1 === emptyRow) {
    result = true;
  } else if (tileRow - 1 === emptyRow) {
    result = true;
  }

  return result;
};

const moveTile = (element) => {
  // TOOD: Move the tile
  const tilesEmpty = document.querySelector(".empty");
  tilesEmpty.innerHTML = element.innerHTML;
  tilesEmpty.classList.remove("empty");
  element.innerHTML = "";
  element.classList.add("empty");
};

const checkIfPlayerWins = () => {
  // TODO: Check if player has won
  const resultToWin = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, null];
  const tdToUse = [];
  tiles.forEach((td) => {
    tdToUse.push(td.innerHTML);
  });
  const compare = tdToUse.toString() === resultToWin.toString();
  // console.log(compare);
  // console.log(resultToWin);
  // console.log(tdToUse.toString());
  return compare;
};

console.log(checkIfPlayerWins());

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener('click', () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
