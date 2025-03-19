import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

// Example of a Mixin
mixin LoggerMixin {
  void log(String message) {
    print('LOG: $message');
  }

  void logError(String error) {
    print('ERROR: $error');
  }
}

// Another Mixin example
mixin ValidationMixin {
  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.length >= 8;
  }
}

// Class using mixins
class UserAuthentication with LoggerMixin, ValidationMixin {
  bool login(String email, String password) {
    log('Attempting login for $email');

    if (!isEmailValid(email)) {
      logError('Invalid email format');
      return false;
    }

    if (!isPasswordValid(password)) {
      logError('Password too short');
      return false;
    }

    log('Login successful');
    return true;
  }
}

// Class with static methods
class MathUtils {
  // Static method that works
  static double calculateArea(double radius) {
    return math.pi * radius * radius;
  }

  // Static method that doesn't perform (example of a problematic static method)
  static void printInstanceProperty() {
    // This won't work because static methods can't access instance properties
    // print(this.someProperty); // This would cause an error

    // Static methods can only access static properties
    print('Static methods cannot access instance properties with "this"');
  }

  // Another example of a static method with limitations
  static void updateUI() {
    // Static methods can't directly update UI or access context
    // They can't access instance state or trigger rebuilds
    print('Static methods cannot directly update UI components');
  }
}

// After the MathUtils class, let's add a class with try-catch examples
class ErrorHandlingExamples {
  // Example 1: Basic try-catch
  static void basicTryCatch() {
    try {
      // Attempting to parse an invalid number
      int result = int.parse('not a number');
      print('Result: $result'); // This line won't execute
    } catch (e) {
      print('Error caught: $e');
    }
  }

  // Example 2: Try-catch with specific exception types
  static void specificExceptions() {
    try {
      List<int> numbers = [1, 2, 3];
      print(numbers[10]); // This will throw an RangeError
    } on RangeError catch (e) {
      print('Range error: $e');
    } on FormatException catch (e) {
      print('Format exception: $e');
    } catch (e) {
      print('Some other error: $e');
    }
  }

  // Example 3: Try-catch-finally
  static void tryCatchFinally() {
    try {
      double result = 10 / 0; // Division by zero
      print('Result: $result');
    } catch (e) {
      print('Error in calculation: $e');
    } finally {
      print('This code always executes, regardless of errors');
    }
  }

  // Example 4: Rethrow an exception
  static void rethrowExample() {
    try {
      _methodThatMightFail();
    } catch (e) {
      print('Caught in rethrowExample, but rethrowing: $e');
      rethrow; // Rethrow the exception to be caught by a higher level
    }
  }

  static void _methodThatMightFail() {
    throw Exception('Something went wrong!');
  }
}

// Image Slider with Controllers
class ImageSliderExample extends StatefulWidget {
  const ImageSliderExample({super.key});

  @override
  State<ImageSliderExample> createState() => _ImageSliderExampleState();
}

class _ImageSliderExampleState extends State<ImageSliderExample> {
  // Controller for the page view
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Timer for auto-sliding
  Timer? _autoSlideTimer;

  // List of sample images
  final List<String> imageUrls = [
    'https://picsum.photos/id/1/500/300',
    'https://picsum.photos/id/10/500/300',
    'https://picsum.photos/id/100/500/300',
    'https://picsum.photos/id/1000/500/300',
  ];

  @override
  void initState() {
    super.initState();
    // Start auto-sliding when the widget initializes
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // Cancel the timer when the widget is disposed
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  // Method to start auto-sliding
  void _startAutoSlide() {
    // Cancel any existing timer
    _autoSlideTimer?.cancel();

    // Create a new timer that fires every 5 seconds
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < imageUrls.length - 1) {
        goToNextSlide();
      } else {
        // If we're at the last slide, go back to the first
        goToSlide(0);
      }
    });
  }

  // Method to pause auto-sliding (useful when user is interacting)
  void _pauseAutoSlide() {
    _autoSlideTimer?.cancel();
  }

  // Method to resume auto-sliding
  void _resumeAutoSlide() {
    _startAutoSlide();
  }

  void goToNextSlide() {
    if (_currentPage < imageUrls.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void goToPreviousSlide() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void goToSlide(int index) {
    if (index >= 0 && index < imageUrls.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Add this new method for safe image loading
  Widget safeLoadImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print('Error loading image: $error');
        return Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.error, color: Colors.red, size: 50),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value:
                loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Modern image carousel
          SizedBox(
            height: 320,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Main image carousel
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTapDown: (_) => _pauseAutoSlide(),
                        onTapUp: (_) => _resumeAutoSlide(),
                        child: Hero(
                          tag: 'carousel_image_$index',
                          child: safeLoadImage(imageUrls[index]),
                        ),
                      );
                    },
                  ),
                ),

                // Gradient overlay for better text visibility
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: .7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // Caption text
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Text(
                    'Beautiful picture ${_currentPage + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                ),

                // Navigation buttons
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton.filledTonal(
                          onPressed: goToPreviousSlide,
                          icon: const Icon(Icons.chevron_left, size: 32),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.3,
                            ),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),

                      // Next button
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton.filledTonal(
                          onPressed: goToNextSlide,
                          icon: const Icon(Icons.chevron_right, size: 32),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.3,
                            ),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Image counter badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Badge(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      '${_currentPage + 1}/${imageUrls.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Control panel
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Modern indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageUrls.length,
                    (index) => GestureDetector(
                      onTap: () => goToSlide(index),
                      child: Container(
                        width: 60,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color:
                              _currentPage == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Thumbnail preview
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => goToSlide(index),
                        child: Container(
                          width: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                _currentPage == index
                                    ? Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    )
                                    : null,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: safeLoadImage(imageUrls[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Control buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: _pauseAutoSlide,
                      icon: const Icon(Icons.pause),
                      label: const Text('Stop'),
                    ),
                    const SizedBox(width: 16),
                    FilledButton.icon(
                      onPressed: _resumeAutoSlide,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeWorkExample extends StatelessWidget {
  const HomeWorkExample({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = UserAuthentication();
    auth.login('test@example.com', 'password123');

    final area = MathUtils.calculateArea(5.0);
    print('Area of circle: $area');

    MathUtils.printInstanceProperty();

    // Demonstrate try-catch examples
    try {
      ErrorHandlingExamples.basicTryCatch();
      ErrorHandlingExamples.specificExceptions();
      ErrorHandlingExamples.tryCatchFinally();

      try {
        ErrorHandlingExamples.rethrowExample();
      } catch (e) {
        print('Caught rethrown exception: $e');
      }
    } catch (e) {
      print('Unexpected error in examples: $e');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Homework Example')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ImageSliderExample(),
      ),
    );
  }
}
