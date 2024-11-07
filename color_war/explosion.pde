void checkExplosion(int i, int j) {
  int maxAtoms = getMaxAtoms(i, j);

  // If the number of atoms exceeds the limit, trigger an explosion
  if (atoms[i][j] >= maxAtoms) {
    atoms[i][j] = 0;  // Clear the atoms in the current cell
    owners[i][j] = 0;  // The cell becomes neutral
    
    // Spread atoms to adjacent cells
    spreadAtoms(i - 1, j); // Left
    spreadAtoms(i + 1, j); // Right
    spreadAtoms(i, j - 1); // Up
    spreadAtoms(i, j + 1); // Down
  }
}

void spreadAtoms(int i, int j) {
  // Ensure the cell is within the grid boundaries
  if (i >= 0 && i < cols && j >= 0 && j < rows) {
    atoms[i][j]++;  // Add an atom to the neighboring cell
    owners[i][j] = currentPlayer;  // Set ownership to the current player
    checkExplosion(i, j);  // Recursively check for explosions in the neighboring cells
  }
}

int getMaxAtoms(int i, int j) {
  int maxAtoms = 4;  // Default max for inner cells
  if (i == 0 || i == cols - 1) maxAtoms--;  // Edge cells hold fewer atoms
  if (j == 0 || j == rows - 1) maxAtoms--;  // Corner cells hold the fewest
  return maxAtoms;
}
