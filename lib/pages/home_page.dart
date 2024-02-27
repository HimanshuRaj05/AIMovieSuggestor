import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_suggester_ariessynapse/utils/movie_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  void addMovie() {
    String inputString = _controller.text;
    _controller.clear();
    print(inputString);

    bool addingName = true;
    int numberInput = 0;

    String inputName = '';
    for (int i = 0; i < inputString.length; i++) {
      if (inputString[i] == ',') {
        addingName = false;
        continue;
      }

      if (addingName) {
        inputName += inputString[i];
      } else {
        print(i);
        print(numberInput);
        numberInput = int.parse(inputString[i]);
        addingName = true;
        break;
      }
    }

    movieNames.add(inputName);
    ratingList.add(numberInput);

    movieMap[numberInput] = inputName;

    sortThings();
  }

  void sortThings() {
    ratingList.sort((a, b) => b.compareTo(a));

    List<String> newMovieList = [];

    for (int i = 0; i < ratingList.length; i++) {
      newMovieList.add(movieMap[ratingList[i]] ?? 'Unknown');
    }

    movieNames = newMovieList;

    setState(() {});
  }

  List<String> movieNames = [];
  List<int> ratingList = [];

  Map<int, String> movieMap = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Movie recommender',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: movieNames.length,
                itemBuilder: (context, index) {
                  return MovieTile(
                      movieName: movieNames[index],
                      rating: ratingList[index].toString());
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10), // Adjust padding as needed
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors
                              .black87), // Add border for visual separation
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter movie name, rating...',
                        border:
                            InputBorder.none, // Remove border from TextField
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () => addMovie(),
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
