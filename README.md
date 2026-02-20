
---
# ScaffoldIo - Ecommerce (Kapda UI) 🚀

A premium, production-ready Flutter Ecommerce/Fashion project starter. This template provides a high-quality UI foundation based on the Kapda app, including professional folder structures and reusable components.

## ✨ Features

* **Fashion-Focused UI:** Complete screens for Splash, Home, Product Detail, and Profile.
* **Dynamic Scaffolding:** Automatically renames project imports, Android package names, and iOS bundle IDs.
* **State Management:** Pre-configured with MobX (`store` folder).
* **Clean Architecture:** Organized into `components`, `utils`, `services`, and `extensions`.

---

## 🚀 How to Use

### 1. Install Mason

If you haven't already, install the Mason CLI:

```bash
dart pub global activate mason_cli

```

### 2. Add this Brick

Add ScaffoldIo to your local environment directly from GitHub:

```bash
mason add scaffoldio_ecommerce --git-url https://github.com/HirenMakwana45/scaffoldio_ecommerce

```

### 3. Generate Your Project

Navigate to your desired project folder and run:

```bash
mason make scaffoldio_ecommerce

```

---

## 🛠 Variables

When you run the command, you will be prompted for the following:

| Variable | Description | Default |
| --- | --- | --- |
| `name` | Internal project name (snake_case) | `my_new_store` |
| `storeName` | Display name shown in the App UI | `Kapda Fashion` |

---

## 📁 Project Structure

The generated project follows this senior-level structure:

* `lib/screens` - All high-quality UI screens.
* `lib/utils` - App colors, constants, and configurations.
* `lib/store` - State management logic.
* `assets/` - Professional icons and image placeholders.

**Created by [Hiren Makwana**](https://github.com/HirenMakwana45)

---
