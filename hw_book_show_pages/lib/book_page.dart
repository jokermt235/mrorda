import 'package:flutter/material.dart';
import 'page_transition.dart';

class BookPage extends StatelessWidget {
  final int pageNumber;

  BookPage(this.pageNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page $pageNumber')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is page $pageNumber', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (pageNumber < 5) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return BookPage(pageNumber + 1);
                      },
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return createPageTransition(
                          animation,
                          child,
                          Offset(1.0, 0.0),
                          Offset.zero,
                        );
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return BookPage(1);
                      },
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return createPageTransition(
                          animation,
                          child,
                          Offset(-1.0, 0.0),
                          Offset.zero,
                        );
                      },
                    ),
                  );
                }
              },
              child: Text(pageNumber == 5 ? 'Start Over' : 'Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
