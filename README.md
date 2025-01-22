# Fibonacci Flutter App

## Overview

This project fulfills the requirements of the task by creating a **Fibonacci number list** widget with scrollable functionality, a **BottomSheet** for filtering items based on their type, and interaction functionalities like tapping on numbers and selecting them. The app is built using **MVC (Model-View-Controller)** architecture with **ValueNotifier** as the state management solution. The project does not rely on any third-party libraries or external dependencies.

## Features

1. **Scrollable Widget**: 
   - Displays a list of Fibonacci numbers.
   - Supports both vertical and horizontal scrolling.
   - At least the first 40 Fibonacci numbers are included.

2. **Display Widget**:
   - Each Fibonacci number is displayed alongside its value and a symbol representing its type.
   - Types include:
     - Even (Square icon)
     - Odd (Cross icon)
     - Prime (Circle icon)

3. **Tap Functionality**:
   - Tapping on any Fibonacci number opens a **BottomSheet**.
   - The BottomSheet filters items based on the type of the tapped Fibonacci number.
   - Items in the BottomSheet are tappable, and upon tapping, they return to the main list.
   - The newly added item is highlighted, and the main list scrolls to show it.

## Architecture

The app follows the **MVC (Model-View-Controller)** architecture:

- **Model**: Represents the data layer, including the `ItemModel` and `HomeModel`. The model is responsible for generating Fibonacci numbers, classifying them by type, and managing the selected item.
  
- **View**: Contains the UI components, including the Fibonacci number list and BottomSheet UI elements.

- **Controller**: Acts as the mediator between the View and Model, controlling the business logic such as selecting items and handling scroll actions.

### State Management
State is managed using **ValueNotifier**. The `selectItems` ValueNotifier tracks the currently selected Fibonacci item, and the view listens to changes in `selectItems` to update the UI accordingly.

## Testing

- **Unit Tests**: 
  - Tests are written for the business logic in the model, including selecting items, filtering Fibonacci items based on type, and ensuring proper scroll behavior.
  
- **Widget Tests**:
  - Tests are written to ensure the UI components display as expected, including the Fibonacci number list, icons, and functionality of tapping on items and opening the BottomSheet.

```bash
flutter test
```
### No External Libraries
This project does not use any third-party libraries outside of Flutter's built-in packages, keeping the codebase lightweight and easy to manage.

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/SuphonSaejia/fibonacci_flutter.git
cd fibonacci_flutter
```

## Example of Diaplay Features
![](example.gif)