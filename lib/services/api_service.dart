import 'package:dio/dio.dart';
import '../models/book.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Book>> fetchBooks() async {
    try {
      // In a real app, this would be a real API endpoint
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      
      // Mock data
      final mockBooks = [
        {
          'id': '1',
          'title': 'Mathematics for Beginners',
          'author': 'John Doe',
          'category': 'Mathematics',
          'description': 'A comprehensive guide to basic mathematics concepts.',
          'price': 29.99,
          'pages': 320,
          // Replace all image URLs with HTTPS versions:
'coverUrl': 'https://via.placeholder.com/150',
'samplePages': [
  'https://via.placeholder.com/300x400',
  'https://via.placeholder.com/300x400',
],
        },
        {
          'id': '2',
          'title': 'World History',
          'author': 'Jane Smith',
          'category': 'History',
          'description': 'An overview of world history from ancient times to modern days.',
          'price': 34.99,
          'pages': 450,
          // Replace all image URLs with HTTPS versions:
'coverUrl': 'https://via.placeholder.com/150',
'samplePages': [
  'https://via.placeholder.com/300x400',
  'https://via.placeholder.com/300x400',
],
        },
        {
          'id': '3',
          'title': 'Advanced Calculus',
          'author': 'Robert Johnson',
          'category': 'Mathematics',
          'description': 'Advanced calculus concepts for university students.',
          'price': 49.99,
          'pages': 520,
          // Replace all image URLs with HTTPS versions:
'coverUrl': 'https://via.placeholder.com/150',
'samplePages': [
  'https://via.placeholder.com/300x400',
  'https://via.placeholder.com/300x400',
],
        },
        {
          'id': '4',
          'title': 'Ancient Civilizations',
          'author': 'Emily Brown',
          'category': 'History',
          'description': 'Exploring ancient civilizations and their impact.',
          'price': 27.99,
          'pages': 380,
          // Replace all image URLs with HTTPS versions:
'coverUrl': 'https://via.placeholder.com/150',
'samplePages': [
  'https://via.placeholder.com/300x400',
  'https://via.placeholder.com/300x400',
],
        },
      ];

      return mockBooks.map((book) => Book.fromJson(book)).toList();
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }
}