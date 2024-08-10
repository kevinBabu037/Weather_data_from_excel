![459_2x_shots_so](https://github.com/user-attachments/assets/7c86fd88-d2b8-4832-b50a-576e52753239)
Project Documentation
Overview
This project includes two distinct roles: Admin and User, with functionalities separated into clear navigation paths and isolated features to ensure non-overlapping interactions. Firebase Authentication and BLoC state management have been utilized to enhance security and maintainable code structure.

1. Admin Role
Functionality
Add Country, State, District, and City:
Description: Admins can add new entries for countries, states, districts, and cities into Firebase Firestore.
Implementation:
Firebase Firestore: Data is stored in Firestore collections.
Firebase Authentication: Used to verify admin access and manage authentication.
UI Components: Forms for data input with validation.
BLoC Pattern: Utilized for managing state changes related to data addition.
Endpoints and Data Structure
Firestore Collections:
countries
states
districts
cities
2. User Role
Functionality
Display List of Added Locations:

Description: Users can view a list of available countries, states, districts, and cities.
Implementation:
UI Components: ListViews or GridViews for displaying data.
BLoC Pattern: Used to handle data fetching and state updates.
Upload Excel File:

Description: Users can upload an Excel file containing location details.
Implementation:
File Upload: Use a file picker to upload Excel files.
API Call: Parse the file and make an API call to fetch weather reports.
Data Parsing: Utilize libraries to read and parse Excel data.
BLoC Pattern: Manages file upload and data processing state.
Display Weather Reports:

Description: Show weather information based on uploaded file details in five different layouts.
Implementation:
Weather API: Make API requests to fetch weather data.
UI Layouts: Implement various layouts for displaying weather information.
BLoC Pattern: Handles state management for weather data fetching and UI updates.
API Endpoints
Weather API:
Endpoint: /weather
Method: GET
Parameters: city, state, country
3. General Requirements
Navigation
Separate Paths:
Admin: admin_dashboard → add_location → manage_locations
User: user_home → view_locations → upload_file
Code Structure
Clean and Maintainable:
Modular Architecture: Code is organized into modules such as authentication, data management, and UI components.
BLoC Pattern: Ensures separation of business logic from UI, making the codebase scalable and easier to maintain.
Firebase Auth: Secures application by managing user authentication and roles.
Dependencies
Firebase: For authentication and Firestore database management.
BLoC: For state management.
Excel File Handling: Libraries for reading and parsing Excel files.
Conclusion
This project leverages Firebase Authentication for secure access, Firestore for data management, and BLoC for robust state management. The design ensures that Admin and User functionalities are clearly separated and easy to navigate, with a focus on maintainable and clean code architecture.

