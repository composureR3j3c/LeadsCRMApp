List<String> myList = ['apple', 'banana', 'orange', 'kiwi'];

searchList(String keyword) {
  List<String> searchResults =
      myList.where((item) => item.contains(keyword)).toList();

  if (searchResults.isEmpty) {
    print('No matching results found');
  } else {
    print('Matching results: $searchResults');
  }

  return searchResults;
}

void main() {
  searchList('apple'); // replace 'apple' with your desired keyword
}
