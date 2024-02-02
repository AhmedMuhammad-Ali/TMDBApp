# TMDBApp - iOS Project Readme

### Project Overview

>TMDBApp is an iOS application that showcases the use of modern Swift concurrency, clean architecture, modularization, Combine, UIKit, efficient dependency management, and the Coordinator pattern for navigation. The app is designed to run on a minimum iOS version of 17 and provides features for exploring Movies and Movie Details. The presentation layer is implemented using the MVVMC (Model-View-ViewModel-Coordinator) architecture pattern.


## Features

- Users can view a infinte list of movies.
- Users can explore the movies details.

## Project Structure

### The project is organized into several modules:

- TMDBApp: This is the main application module responsible for user interface and navigation. The Coordinator pattern is employed to handle navigation between different screens.
- Domain: The Domain module holds the core business logic and models of the application. It defines the entities and use cases that drive the app's functionality.
- Core: The Core module serves as the data source module, handling data fetching.
- Networking: This module contains network-related code for making API requests to the themoviedb API. It uses swift modern concurrency for handling asynchronous operations.
- Storage: TBD ⌛️.
## Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")

## Presentation Layer

### MVVM Architecture

>The presentation layer of TMDBApp is implemented using the MVVM (Model-View-ViewModel) architectural pattern. This pattern promotes separation of concerns and provides a clear structure for building user interfaces. Key components include:

- Model: Represents the application's data and business logic. In this case, the Domain module serves as the source of models.
- View: Represents the user interface and displays data to the user. Views are implemented using UIKit.
- ViewModel: Acts as an intermediary between the Model and View. It contains presentation logic, handles user input, and prepares data for display. The MVVM pattern allows for unit testing of ViewModels, making it easier to verify their correctness.

## Domain Layer

>The Domain layer of TMDBApp  plays a central role in defining the business logic and rules of your application which contains the  **Entities** +  **Use Cases** +  **Repositories Interfaces**

## Core Layer

>The Core layer of TMDBApp is responsible for handling network calls and storage operations and provide a concrete implementation for Repositories Interfaces. contains **Repositories Implementations** + **API (Network)** + **Persistence DB**

## Coordinator Pattern

>The Coordinator pattern is used for navigation management in TMDBApp. Coordinators help maintain a separation of concerns and facilitate navigation between different screens. Each coordinator is responsible for a specific flow within the app, making the navigation logic more organized and maintainable.

## Concurrency and Combine

>The project utilizes modern Swift concurrency to efficiently handle asynchronous tasks. Combine is used for managing and transforming data flows within the application.


## Extensive Unit Testing

>The project includes extensive unit testing for all use cases, ensuring code quality and reliability. Custom network testing with extended URLProtocol allows for comprehensive end-to-end flow testing. This approach guarantees that the app's functionality remains robust and reliable under various conditions also In addition, I have implemented unit tests specifically for the PagingManager to thoroughly assess and verify the paging functionality. These tests cover a range of scenarios to ensure that the paging mechanism operates as expected, providing a reliable and seamless user experience.

## TMDBApp Tech-Stack

- [Modularization] - Modular project structure: Separates the project into distinct modules to improve maintainability and scalability.
- [Coordinator Pattern] - Used for navigation management, keeping navigation logic organized and separate from the UI.
- [UIkit] - Utilized for specific UI components and screens within the app.
- [Combine] - A framework for processing values over time, used for managing data flows and asynchronous operations.
- [Swift Concurrency] - Utilizes Swift's concurrency features, such as async/await, to handle asynchronous tasks efficiently.
- [DIContainer] - A custom dependency injection container for managing dependencies and their lifetimes.
- [UITableViewDataSourcePrefetching] - A protocol that provides advance warning of the data requirements for a table view, allowing you to start potentially long-running data operations early.
- [SwiftLint] - tool that enforces code style guidelines and performs static analysis on Swift source code.

## Minimum iOS Version

>TMDBApp is designed to run on iOS 17 or later, making use of the latest iOS features and enhancements.

## Screenshots 🌠
![Alt text](README_FILES/screenshot.png?raw=true "Modules Dependencies")
