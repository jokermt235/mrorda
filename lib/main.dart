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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Premium style image carousel
          Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Stack(
              children: [
                // Main carousel with parallax effect
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
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
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Image with parallax effect
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOutQuint,
                              width: MediaQuery.of(context).size.width + 20,
                              left: -10,
                              top: 0,
                              bottom: 0,
                              child: safeLoadImage(imageUrls[index]),
                            ),

                            // Stylish overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.6),
                                  ],
                                  stops: const [0.6, 0.8, 1.0],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Elegant caption with animation
                Positioned(
                  bottom: 30,
                  left: 30,
                  right: 30,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: 1.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'COlLECTION ${_currentPage + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Beautiful Nature',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Discover the unique beauty of nature',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Elegant navigation controls
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: _currentPage > 0 ? 1.0 : 0.3,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: .2),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: .3),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .1),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: goToPreviousSlide,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                              ),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ),

                      // Next button
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity:
                              _currentPage < imageUrls.length - 1 ? 1.0 : 0.3,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: .2),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: .3),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .1),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: goToNextSlide,
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Premium indicator dots
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imageUrls.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:
                                _currentPage == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white.withValues(alpha: .5),
                            boxShadow:
                                _currentPage == index
                                    ? [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withValues(alpha: .5),
                                        blurRadius: 6,
                                        spreadRadius: 0,
                                      ),
                                    ]
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Interactive thumbnails with 3D effect
          const SizedBox(height: 24),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                bool isActive = _currentPage == index;
                return GestureDetector(
                  onTap: () => goToSlide(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutQuint,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: isActive ? 0 : 10,
                    ),
                    width: isActive ? 100 : 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color:
                              isActive
                                  ? Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: .4)
                                  : Colors.black.withValues(alpha: .2),
                          blurRadius: isActive ? 12 : 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border:
                          isActive
                              ? Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 3,
                              )
                              : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: safeLoadImage(imageUrls[index]),
                    ),
                  ),
                );
              },
            ),
          ),

          // Interactive control panel
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  icon: Icons.skip_previous_rounded,
                  label: 'First',
                  onTap: () => goToSlide(0),
                ),
                _buildControlButton(
                  icon: Icons.pause_rounded,
                  label: 'Pause',
                  onTap: _pauseAutoSlide,
                ),
                _buildControlButton(
                  icon: Icons.play_arrow_rounded,
                  label: 'Play',
                  onTap: _resumeAutoSlide,
                ),
                _buildControlButton(
                  icon: Icons.skip_next_rounded,
                  label: 'Last',
                  onTap: () => goToSlide(imageUrls.length - 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
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
