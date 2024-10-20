void main() {
  // A list of numbers
  const List<int> numbers = [1, 2, 3, 4, 5, 6];

  // Loop through the list of numbers
  for (var number in numbers) {
    // Check if the number is even or odd
    if (number % 2 == 0) {
      print("$number is even."); // Output for even numbers
    } else {
      print("$number is odd."); // Output for odd numbers
    }
  }
}
