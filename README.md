# Shop App

Shop App is an e-commerce iOS application that allows users to browse products by categories, add items to their cart, complete purchases, and save favorite products. The app is built using SwiftUI with the MVVM architecture and utilizes [Fake Store API](https://fakestoreapi.com/) for fetching product data.

## 📌 General Features

- **MVVM Architecture**: Ensures a clean separation of concerns, making the app maintainable and scalable.
- **SwiftUI**: The entire user interface is developed using SwiftUI, leveraging declarative UI principles.
- **State Management**: Effectively manages data flow and UI updates using SwiftUI state management tools.
- **Design Patterns**:
  - Applied inheritance and abstractions to prevent code duplication.
  - Implemented the Factory pattern for shared object creation.
- **FileManager Integration**: Used for saving favorite products and managing cart items persistently.
- **Onboarding Control**: Utilized `@AppStorage` to track user onboarding status and preferences.
- **Networking**: Built a custom network layer using Moya for clean and structured API requests.

## 🛍️ Features

### 🔹 Product Listing by Categories

- Users can browse products categorized for easy navigation.
- Data is fetched dynamically from the API.
- Smooth UI updates using SwiftUI.

### 🔹 Product Detail Screen

- Displays detailed product information including images, description, price, and category.
- Users can add items to their cart or mark them as favorites.

### 🛒 Shopping Cart

- Users can add and remove products from the cart.
- Displays total price calculation before checkout.
- Persistent storage using FileManager.
- **🎬 Lottie Animation**: Displays an engaging animation when the cart is empty.

### ❤️ Favorites

- Users can save and view their favorite products.
- Uses FileManager for persistent storage.
- **🎬 Lottie Animation**: A custom animation is shown when the favorites list is empty.

### 💳 Checkout & Payment

- Simulates a checkout process where users can proceed with payments.
- Displays order summary before confirming the purchase.

## 📚 Libraries Used

- **Moya**: For networking and API management.
- **SwiftUI**: For building the user interface.
- **FileManager**: For local storage of favorites and cart items.
- **Lottie**: For displaying animations in empty states.

## 🎥 Demo Video

You can watch a demo of the app in action below:

[![Watch Demo](https://img.youtube.com/vi/YOUTUBE_VIDEO_ID/maxresdefault.jpg)](https://github.com/user-attachments/assets/add23b51-6e56-4c60-a021-8a8e00c8ff46)

---

🚀 **Happy coding! Let me know if you need any modifications.** 🚀
