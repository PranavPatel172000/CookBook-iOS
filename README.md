# 🍳 Cookbook - SwiftUI iOS App

A modern **Cookbook iOS application** built using **SwiftUI**, designed to help users store, organize, and discover recipes efficiently.
The app allows users to manage **ingredients and recipes**, and suggests what can be cooked based on available ingredients.

---

## 🚀 Features

* 📖 View and add recipes
* 🥕 Manage ingredients with measurement units
* 🔍 Search functionality for both recipes and ingredients
* 🍲 "Cook" feature to display recipes based on available ingredients
* 🔗 Relationship mapping between recipes and ingredients
* 🎨 Clean UI using native SwiftUI components
* 💾 Local data persistence using Core Data

---

## 🛠️ Tech Stack

* **SwiftUI** – Declarative UI framework
* **Core Data** – Local database & relationship management
* **MVVM Architecture** – Scalable and maintainable code structure
* **Swift Concurrency** – Efficient data handling
* **Swift** – Core programming language

---

## 🧠 Architecture

The project follows the **MVVM (Model-View-ViewModel)** pattern:

* **Model** → Core Data entities (Recipe, Ingredient)
* **ViewModel** → Handles business logic, search & filtering
* **View** → SwiftUI views for UI rendering

---

## 🔍 Search Functionality

* Real-time search for:

  * Recipes
  * Ingredients
* Improves usability and quick data access
* Implemented using SwiftUI state management

---

## 🍲 Cook Feature (Core Logic)

* Displays recipes that can be prepared using selected/available ingredients
* Demonstrates filtering logic using relationships
* Mimics real-world recipe recommendation behavior

---

## 📱 App Structure

The app uses a **TabView-based navigation**:

* 📖 **Recipes Tab** → Manage recipes
* 🥕 **Ingredients Tab** → Manage ingredients
* 🍳 **Cook Tab** → Discover recipes based on ingredients

---

## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/5d171ff0-0f2a-4eb9-b9ab-58617da2657b" width="250"/>
  <img src="https://github.com/user-attachments/assets/527ce865-19e8-466d-a982-5e1558acf021" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/f8182d53-1316-494e-a5d3-6e5446c74956" width="250"/>
  <img src="https://github.com/user-attachments/assets/b7ab1075-13b8-40fb-b76b-d4a0072a62d0" width="250"/>
</p>

---

## 💡 What I Learned

* Designing relational data using Core Data
* Implementing MVVM architecture in SwiftUI
* Building scalable multi-screen applications
* Implementing search and filtering logic
* Managing state and data flow efficiently

---

## 🔧 Future Improvements

* ➖ Add delete functionality for recipes & ingredients
* ☁️ Integrate Firebase/Cloud sync
* 🧾 Add recipe image/video support
* ⭐ Favorites / bookmarking feature
* 📊 Advanced filtering (diet, cuisine, time)

---

## 📦 Installation & Setup

1. Clone the repository

```bash id="cb3"
git clone https://github.com/your-username/Cookbook-iOS.git
```

2. Open in Xcode

```bash id="cb4"
Open Cookbook.xcodeproj
```

3. Run the app on simulator or device

---

## 📱 Requirements

* iOS 15.0+
* Xcode 14+

---

## 👨‍💻 Author

**Pranav Patel**

* GitHub: https://github.com/pranavpatel172000
* LinkedIn: https://www.linkedin.com/in/pranav-patel-19b8761b5/

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.
