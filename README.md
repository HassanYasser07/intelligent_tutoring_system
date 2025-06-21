<<<<<<< HEAD
# intelligent_tutoring_system

# 📱 Codingo Mobile App – Intelligent Tutoring System

This is the official **Flutter-based mobile application** for **Codingo**, a smart learning platform that personalizes the programming education experience based on the learner’s background, learning style, and goals.

> 🎓 **Graduation Project – Matrouh University, Faculty of Computers and AI**  
> 🧑‍💻 **Team Members:** Hassan Yasser, Ibrahim Mohamed Hassan, Karim Abdulrahim, Omar Abdelaziz, Tarek Saad Fouad, Yasmin Kotb  
> 🧑‍🏫 **Supervisor:** Dr. Fatma Sayed Gadelrab

---

## 🎯 Project Overview

**Codingo** redefines how programming is taught by combining:

- 📈 **Graph Theory** for concept sequencing  
- 🧬 **Improved Immune Algorithm (IIA)** for personalized path generation  
- 🧠 **Felder–Silverman Learning Style Model (FSLSM)** for cognitive alignment  

Unlike traditional e-learning apps, Codingo adapts the content **per learner** and presents it through:

- A visually engaging, game-like interface  
- Dynamic learning object selection  
- Real-time progress tracking and evaluation  

---

## 📲 App Features

- ✅ Learner onboarding and registration  
- 🧠 FSLSM quiz to detect cognitive style  
- 📘 Choose a track or be guided through CS50  
- 📊 Dynamic learning path tailored to your style  
- 📦 Explore diversified learning objects (videos, quizzes, demos)  
- 🎯 Final exam gates for unit progression  
- 🏆 Gamified visuals inspired by Duolingo  

---

## 🧠 How the Algorithm Works

The mobile app connects to a backend engine that uses an **Improved Immune Algorithm** to generate personalized learning paths.

🔗 [IIA Algorithm Repository](https://github.com/Tarek-Saad/IIA)

---

## 🔐 Authentication & Learner Module

🔗 [Graduation Backend – Auth + FSLSM + Profile](https://github.com/Tarek-Saad/Graduation-learners-module-backend)  

This module handles:

- 🔒 Secure registration and login (JWT-based)  
- 🧩 FSLSM quiz scoring  
- 🎯 Learner goal and knowledge base input  
- 🔗 API connection to the IIA Engine  

---

## 🧩 System Architecture

```text
[ Flutter App ]
    ↓
[ Flask Backend ]
    ├─ Learner Module (FSLSM, Auth)
    ├─ IIA Engine (This Repo)
    ↓
[ Databases ]
    ├─ Neo4j: Concept Graph (DAG)
    ├─ MongoDB: FSLSM Questionnaire
    └─ PostgreSQL: User Data, Results, Feedback

# intelligent_tutoring_system
>>>>>>> b06aa2e7a5a76c88fae2a55ac25a2d8f803d40d3
