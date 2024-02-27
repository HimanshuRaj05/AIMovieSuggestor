import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTile extends StatefulWidget {
  final String movieName;
  final String rating;

  MovieTile({required this.movieName, required this.rating});

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top: 25, left: 20, bottom: 15),
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.movieName,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Icon(Icons.star,
                      color: index < int.parse(widget.rating)
                          ? Colors.yellow
                          : Colors.grey);
                }),
          )
        ]),
      ),
    );
  }
}
