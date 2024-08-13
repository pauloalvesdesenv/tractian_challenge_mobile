# Assets Follow Up

A mobile application to track and manage company assets.

This code was developed as a challenge for TRACTIAN.

## Notes

- Although Flutter is an extremely flexible framework and this application could be developed in a less "scalable" way, I considered it essential to approach it as if I were working on a company product. Therefore, I structured the entire codebase following Clean Architecture and Clean Code principles, implementing layers, abstracting objects, and maintaining a highly organized, readable, and well-typed codebase.
- The application is designed to provide an easy way for companies to keep track of their assets.
- It includes features like asset categorization, tracking, and reporting.
- The user interface is designed to be intuitive, ensuring that users can quickly access the information they need.
- The app was built using Flutter, following best practices in mobile app development, including Clean Architecture and SOLID principles.
- The code is structured to be maintainable and scalable, with modular components that can be easily extended or modified.

## Code Improvements

- Add a parser class.
- Implement `Either<Left, Right>` for handling success and error scenarios.
- Add abstraction layers for a Client and Navigator specific to the application.
- Define enums for `StatusType` and `Status` based on the complete list of possibilities provided by the backend.
- Implement a shimmer effect with a skeleton for a loading page.
- Implement counting of children in each node of the asset tree.
- Write unit tests to ensure easier future maintenance.
