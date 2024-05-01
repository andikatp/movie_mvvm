# Movie
This application is a movie app that fetches data from the OMDB API and is specifically used for applying to Flower Advisor.


## Architecture
The application follows the MVVM (Model-View-ViewModel) architecture as its foundation and incorporates the repository pattern.

## Key Features
- **OMDB API Integration**: Utilizes the OMDB API to retrieve movie data, enabling users to browse and search for movies.
- **Favorites Functionality**: Allows users to mark movies as favorites and access them easily for future reference.
- **Search Feature**: Provides a search functionality for users to find specific movies based on title, genre, or other criteria.
- **Login**: Enables users to login directly within the app.
- **MVVM Architecture**: Adopts the MVVM architecture pattern to separate concerns and facilitate maintainability and testability of the codebase.
- **Repository Pattern**: Implements the repository pattern to abstract data access and provide a clean separation between data sources and the rest of the application.
- **Localization Support**: Supports localization to cater to users from different regions and languages.
- **Responsive UI**: Ensures a responsive user interface across different screen sizes and orientations.
- **Error Handling**: Implements robust error handling mechanisms to provide a seamless user experience even in case of network errors or API failures.

## Library
- **animate_do**: For adding animation effects to UI elements, enhancing the visual appeal of the app.
- **animated_bottom_navigation_bar**: Provides a customizable animated bottom navigation bar for easy navigation between different app screens.
- **bloc_concurrency**: Offers utilities for handling concurrency in BLoC-based state management architecture, ensuring thread safety and efficient data flow.
- **cached_network_image**: Allows for efficient caching of network images, optimizing performance and reducing bandwidth usage.
- **cupertino_icons**: Provides the Cupertino icon set for use in iOS-styled UI components.
- **dartz**: Adds functional programming constructs to Dart, enabling concise and expressive code for error handling and data manipulation.
- **dropdown_button2**: Offers an enhanced dropdown button widget with additional features and customization options.
- **easy_localization**: Simplifies localization management by providing easy-to-use tools and utilities for handling multiple languages and locales.
- **equatable**: Facilitates value equality comparisons for Dart classes, streamlining the implementation of equality checks in data models and entities.
- **floor**: Provides a lightweight SQLite abstraction layer for Flutter, simplifying database interactions and enabling efficient data storage and retrieval.
- **flutter_bloc**: Offers a powerful state management solution based on the BLoC (Business Logic Component) pattern, enhancing code organization and separation of concerns.
- **flutter_cache_manager**: Enables caching of network resources, such as images and files, for improved performance and offline access.
- **flutter_dotenv**: Allows loading environment variables from a .env file, enhancing configuration management and security.
- **flutter_keyboard_visibility**: Provides utilities for detecting keyboard visibility changes, enabling responsive UI adjustments in response to keyboard interactions.
- **flutter_screenutil**: Facilitates responsive UI development by providing utilities for adapting UI elements to different screen sizes and resolutions.
- **flutter_staggered_grid_view**: Offers a staggered grid view widget for displaying items in a grid layout with customizable column counts and item sizes.
- **flutter_svg**: Allows rendering of scalable vector graphics (SVG) in Flutter applications, providing high-quality graphics with minimal file size.
- **freezed_annotation**: Generates boilerplate code for immutable classes and data models, reducing boilerplate code and enhancing code readability and maintainability.
- **get_it**: A lightweight service locator for Dart and Flutter applications, facilitating dependency injection and decoupling of components.
- **go_router**: Provides a flexible and powerful routing solution for Flutter apps, offering declarative route definitions and efficient navigation management.
- **http**: Offers utilities for making HTTP requests in Dart, enabling data retrieval from remote APIs and servers.
- **internet_connection_checker_plus**: Allows checking the internet connection status on the device, enabling the app to react to changes in network connectivity.
- **json_annotation**: Provides annotations for generating JSON serialization and deserialization code, simplifying data serialization and communication with external APIs.
- **like_button**: Offers customizable like button widgets with various animation effects and styles, enhancing user engagement and interaction.
- **lottie**: Enables integration of Lottie animations in Flutter apps, allowing for the display of high-quality animations with minimal performance impact.
- **provider**: Offers a simple and lightweight state management solution based on the provider pattern, facilitating data sharing and management between widgets.
- **shared_preferences**: Provides a simple key-value storage solution for persisting small amounts of data locally on the device, such as user preferences and settings.
- **sqflite**: A Flutter plugin for SQLite database integration, enabling efficient storage and retrieval of structured data in local databases.
- **very_good_analysis**: Offers static code analysis tools and best practice recommendations for Dart and Flutter projects, ensuring code quality and maintainability.

## Screenshot
Screenshots of the application can be found in the "screenshot" folder.