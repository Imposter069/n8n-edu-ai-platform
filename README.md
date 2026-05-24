# 🎓 Smart Education App

A production-grade, AI-powered mobile education platform built with **Flutter**, **Supabase**, **Google Gemini AI**, and **n8n** workflow automation. Designed for students from Class 1 to Engineering — featuring an intelligent AI Tutor, real-time database, cloud storage, dynamic quizzes, and a seamless learning experience.

[Download APK](#android-build--deployment) · [Installation Guide](#-installation-guide) · [Report Bug](https://github.com/yourusername/smart-education-app/issues) · [Request Feature](https://github.com/yourusername/smart-education-app/issues)

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Features](#-features)
- [Unique Features](#-unique-features)
- [Technology Stack](#-technology-stack)
- [System Architecture](#-system-architecture)
- [Database Schema Overview](#-database-schema-overview)
- [AI Integration using n8n + Gemini AI](#-ai-integration-using-n8n--gemini-ai)
- [Supabase Backend Integration](#-supabase-backend-integration)
- [Teacher Module](#-teacher-module)
- [Student Module](#-student-module)
- [Quiz System](#-quiz-system)
- [Watch History System](#-watch-history-system)
- [Authentication System](#-authentication-system)
- [File Upload & Storage](#-file-upload--storage)
- [Screenshots](#-screenshots)
- [Installation Guide](#-installation-guide)
- [Flutter Setup](#-flutter-setup)
- [Supabase Setup](#-supabase-setup)
- [n8n AI Workflow Setup](#-n8n-ai-workflow-setup)
- [Folder Structure](#-folder-structure)
- [Future Enhancements](#-future-enhancements)
- [Challenges Faced](#-challenges-faced)
- [Learning Outcomes](#-learning-outcomes)
- [Contributors](#-contributors)
- [License](#-license)
- [Contact](#-contact)

---

## 🌟 Project Overview

**Smart Education App** is a full-stack, AI-powered mobile learning platform designed to transform how students learn and how teachers teach. Built with **Flutter** for a beautiful cross-platform experience, **Supabase** for real-time cloud backend, **Google Gemini AI** for intelligent tutoring, and **n8n** for powerful workflow automation.

The platform serves two primary roles — **Students** and **Teachers** — each with their own tailored dashboard, experience, and capabilities. Whether it's accessing video lectures, reading e-books, attempting quizzes, or getting instant AI-powered answers, Smart Education App covers it all.

### 🎯 Who Is This For?

| Audience | Use Case |
|----------|----------|
| 🧒 School Students (Class 1–10) | Video lectures, e-books, quizzes, sample papers |
| 👨‍🎓 Engineering Students | Course materials, PDFs, subject resources |
| 👩‍🏫 Teachers | Upload resources, manage subjects, track student activity |
| 🏫 Educational Institutions | Centralized learning management with AI support |

### 💼 Resume-Ready Project Summary

Developed a production-grade AI-powered education mobile application using Flutter, Supabase (PostgreSQL), Google Gemini AI, and n8n workflow automation. Implemented role-based authentication, real-time database, cloud file storage, AI tutoring chatbot, quiz system, watch history tracking, and dynamic resource management for educational resources across school and engineering domains.

---

## ✨ Features

### 🔐 Authentication & Users
- ✅ Student Login & Signup
- ✅ Teacher Login & Signup
- ✅ Role-based Access Control (Student / Teacher)
- ✅ Secure JWT Authentication via Supabase Auth
- ✅ Profile Management

### 📚 Learning Resources
- ✅ Video Lectures (YouTube Integration)
- ✅ E-Books (PDF Viewer)
- ✅ Sample Papers (Downloadable PDFs)
- ✅ Dynamic Subject Management
- ✅ School Section (Class 1–10)
- ✅ Engineering Section

### 🤖 AI Features
- ✅ AI Tutor powered by Google Gemini AI
- ✅ n8n Workflow Automation
- ✅ Smart Q&A on study topics
- ✅ Google Sheets Integration via n8n

### 📊 Dashboards
- ✅ Teacher Dashboard (Upload, Manage, Monitor)
- ✅ Student Dashboard (Browse, Learn, Track)
- ✅ Watch History Tracking
- ✅ Quiz Performance Tracking

### 🎨 UI/UX
- ✅ Dark Modern UI
- ✅ Smooth Animations
- ✅ Responsive Design
- ✅ Intuitive Navigation

### ☁️ Backend & Storage
- ✅ Supabase Cloud Storage Bucket
- ✅ Real-time PostgreSQL Database
- ✅ PDF Upload & Management
- ✅ Secure File Access

---

## 🚀 Unique Features

### 🧠 AI Tutor (Gemini + n8n)
Get instant, intelligent answers to any study question. The AI Tutor is powered by Google Gemini AI, orchestrated through n8n automation workflows, giving students 24/7 access to personalized tutoring.

### 📊 Automated Workflow Engine
n8n handles complex background tasks — from logging AI queries to Google Sheets, to triggering notifications and processing resource uploads automatically.

### 🎯 Dual-Section Learning
Unique split between **School** (Classes 1–10) and **Engineering** sections, each with specialized resources, subjects, and quiz content — all in one unified app.

### 📹 Watch History Intelligence
Tracks every video watched by every student in real-time. Teachers can see engagement metrics and students can resume from where they left off.

### 📝 Intelligent Quiz System
Quizzes for Classes 1–3 with instant scoring, result tracking, and performance analytics — all stored in real-time on Supabase.

### 🔄 Real-time Everything
Built on Supabase's real-time engine — any update to resources, quizzes, or content reflects instantly for all users without a refresh.

---

## 🛠 Technology Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| 📱 Frontend | Flutter + Dart | Cross-platform mobile UI (Android & iOS) |
| 🔧 Backend | Supabase | Auth, Database, Storage, Real-time |
| 🗄️ Database | PostgreSQL (via Supabase) | Relational data storage and queries |
| 🤖 AI Engine | Google Gemini AI | AI Tutor, smart Q&A, content analysis |
| ⚙️ Automation | n8n | Workflow orchestration, AI pipeline, integrations |
| 📊 Data Export | Google Sheets (via n8n) | AI interaction logs, analytics export |
| ☁️ Storage | Supabase Storage Bucket | PDF, image, and resource file storage |
| 🎥 Video | YouTube API | Embedded video lectures |

---

## 🏗 System Architecture

```
┌──────────────────────────────────────────────────────────────┐
│                    SMART EDUCATION APP                        │
│                                                               │
│   Flutter App  ──────────►  Supabase Backend                 │
│   (Mobile UI)  ◄──────────  (Auth + PostgreSQL + Storage)    │
│        │                                                      │
│        ▼                                                      │
│   n8n Server (Workflow Automation)                            │
│        │                                                      │
│        ├──────► Gemini AI (AI Tutor)                         │
│        │                                                      │
│        └──────► Google Sheets (AI Logs & Analytics)          │
└──────────────────────────────────────────────────────────────┘

Data Flow:
Flutter App → Supabase Backend → n8n AI Workflow → Gemini AI → Google Sheets
```

### Architecture Breakdown

| Component | Role |
|-----------|------|
| **Flutter App** | Renders UI, handles user interactions, calls Supabase APIs |
| **Supabase Auth** | Manages user sessions, JWT tokens, role-based access |
| **PostgreSQL** | Stores all structured data (users, resources, quizzes, history) |
| **Supabase Storage** | Stores PDFs, images, and downloadable files |
| **n8n Workflows** | Bridges Flutter → Gemini AI, handles automation pipelines |
| **Gemini AI** | Powers the AI Tutor with natural language understanding |
| **Google Sheets** | Logs AI interactions for analytics and review |

---

## 🗃 Database Schema Overview

### `users`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique user identifier |
| `email` | TEXT | User email address |
| `name` | TEXT | Full name |
| `role` | TEXT | `student` or `teacher` |
| `avatar_url` | TEXT | Profile picture URL |
| `created_at` | TIMESTAMP | Account creation time |

### `education_types`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `name` | TEXT | e.g., "School", "Engineering" |
| `description` | TEXT | Brief description |

### `classes`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `name` | TEXT | e.g., "Class 5", "Semester 3" |
| `education_type_id` | UUID (FK) | References `education_types` |

### `subjects`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `name` | TEXT | Subject name |
| `class_id` | UUID (FK) | References `classes` |
| `icon_url` | TEXT | Subject icon |

### `resources`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `title` | TEXT | Resource title |
| `type` | TEXT | `video`, `pdf`, `ebook`, `sample_paper` |
| `url` | TEXT | Resource URL or storage path |
| `subject_id` | UUID (FK) | References `subjects` |
| `uploaded_by` | UUID (FK) | Teacher who uploaded |
| `created_at` | TIMESTAMP | Upload timestamp |

### `courses`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `title` | TEXT | Course name |
| `description` | TEXT | Course overview |
| `class_id` | UUID (FK) | References `classes` |
| `thumbnail_url` | TEXT | Course image |

### `watch_history`

| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID (PK) | Unique identifier |
| `user_id` | UUID (FK) | References `users` |
| `resource_id` | UUID (FK) | References `resources` |
| `watched_at` | TIMESTAMP | When watched |
| `duration_watched` | INTEGER | Seconds watched |

### Entity Relationships

```
education_types ──< classes ──< subjects ──< resources
                                                 │
users ──────────────────────────────────────< watch_history
users (teachers) ──────────────────────────> resources (uploaded_by)
classes ──< courses
```

---

## 🤖 AI Integration using n8n + Gemini AI

### How the AI Tutor Works

```
Student asks a question
         │
         ▼
Flutter App  ──HTTP POST──►  n8n Webhook
                                  │
                                  ▼
                      n8n processes the request
                                  │
                                  ▼
                      Gemini AI API Call
                      (with context + question)
                                  │
                                  ▼
                      AI Response generated
                                  │
                     ┌────────────┴────────────┐
                     ▼                         ▼
             Sent back to Flutter App    Logged to Google Sheets
```

### n8n Workflow Steps

1. **Webhook Node** — Receives the student's question from the Flutter app
2. **Set Node** — Formats the prompt with educational context
3. **HTTP Request Node** — Calls Google Gemini AI API
4. **Google Sheets Node** — Logs query + response for analytics
5. **Respond to Webhook Node** — Returns AI response to Flutter

### n8n Workflow Config (JSON)

```json
{
  "workflow": {
    "name": "Smart Education AI Tutor",
    "nodes": [
      { "type": "webhook", "path": "/ai-tutor" },
      { "type": "set", "values": { "prompt": "Educational context: {{question}}" } },
      { "type": "httpRequest", "url": "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent" },
      { "type": "googleSheets", "operation": "append" },
      { "type": "respondToWebhook" }
    ]
  }
}
```

### Flutter → n8n Integration

```dart
class AITutorService {
  static const String n8nWebhookUrl =
      'https://your-n8n-instance.com/webhook/ai-tutor';

  Future<String> askQuestion(String question) async {
    final response = await http.post(
      Uri.parse(n8nWebhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'question': question,
        'userId': supabase.auth.currentUser!.id,
      }),
    );
    final data = jsonDecode(response.body);
    return data['answer'];
  }
}
```

---

## 🔌 Supabase Backend Integration

### Initialization

```dart
// main.dart
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
```

### Key Supabase Operations

```dart
// Fetch resources by subject
final resources = await supabase
    .from('resources')
    .select()
    .eq('subject_id', subjectId)
    .order('created_at', ascending: false);

// Real-time subscription
supabase
    .from('resources')
    .stream(primaryKey: ['id'])
    .listen((List<Map<String, dynamic>> data) {
      setState(() => _resources = data);
    });

// Upload file to storage
final path = await supabase.storage
    .from('education-files')
    .upload('pdfs/$fileName', fileBytes);
```

### Row Level Security (RLS) Policies

| Table | Policy | Access |
|-------|--------|--------|
| `users` | Read own profile | Authenticated users |
| `resources` | Read all | All authenticated |
| `resources` | Write | Teachers only |
| `watch_history` | Read/Write own | Own records only |
| `courses` | Read all | All authenticated |

---

## 👩‍🏫 Teacher Module

Teachers have full control over educational content through a dedicated dashboard.

### Capabilities

| Feature | Description |
|---------|-------------|
| 📤 Upload Resources | Add videos, PDFs, e-books, sample papers |
| 📁 Manage Content | Edit, delete, and organize resources by subject |
| 📊 View Analytics | See watch history and student engagement |
| 📚 Subject Management | Create and manage subjects for any class |
| 🎥 YouTube Integration | Add YouTube video lecture links |
| 📄 PDF Management | Upload PDFs directly to Supabase Storage |

### Teacher Dashboard Flow

```
Teacher Login
     │
     ▼
Dashboard Overview
     ├─► My Subjects → Add/Edit Resources
     ├─► Upload Content → PDF / Video / E-Book
     ├─► Student Activity → Watch History View
     └─► Quiz Management → Create/Edit Quizzes
```

---

## 🎓 Student Module

Students enjoy a clean, intuitive learning experience with AI-powered assistance.

### Capabilities

| Feature | Description |
|---------|-------------|
| 📖 Browse Resources | Access videos, books, papers by class & subject |
| 🤖 AI Tutor | Ask the Gemini-powered AI any study question |
| 📝 Take Quizzes | Attempt subject quizzes and track scores |
| 📜 Watch History | View previously watched videos |
| 📥 Download PDFs | Download sample papers and e-books |
| 🎓 Course Enrollment | Access structured course content |

### Student Dashboard Flow

```
Student Login
     │
     ▼
Home Dashboard
     ├─► School Section → Select Class → Subject → Resources
     ├─► Engineering Section → Semester → Subject → Resources
     ├─► AI Tutor → Ask Question → Get AI Answer
     ├─► My Quizzes → Attempt Quiz → View Score
     └─► Watch History → Resume Learning
```

---

## 📝 Quiz System

The Smart Education App includes an interactive quiz system specifically designed for **Classes 1–3**, with plans to expand to all classes.

### Quiz Features

- 🎯 Multiple-choice questions per subject
- ⏱️ Timed quiz sessions
- ✅ Instant result display
- 📊 Score storage in Supabase
- 🔄 Retake support
- 📈 Progress tracking over time

### Quiz Database Structure

```sql
CREATE TABLE quizzes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  subject_id UUID REFERENCES subjects(id),
  class_id UUID REFERENCES classes(id),
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE quiz_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  quiz_id UUID REFERENCES quizzes(id),
  question TEXT NOT NULL,
  option_a TEXT,
  option_b TEXT,
  option_c TEXT,
  option_d TEXT,
  correct_answer TEXT NOT NULL
);

CREATE TABLE quiz_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  quiz_id UUID REFERENCES quizzes(id),
  score INTEGER,
  attempted_at TIMESTAMP DEFAULT NOW()
);
```

---

## 📹 Watch History System

Every video watched by a student is recorded in real-time, enabling:

- 📌 Resume from last watched position
- 📊 Teacher analytics on popular content
- 🏆 Student engagement tracking
- 🔄 Recently watched section on the dashboard

### Implementation

```dart
// Record watch history on video open
Future<void> recordWatchHistory(String resourceId) async {
  await supabase.from('watch_history').upsert({
    'user_id': supabase.auth.currentUser!.id,
    'resource_id': resourceId,
    'watched_at': DateTime.now().toIso8601String(),
  });
}

// Fetch watch history
Future<List<Map>> getWatchHistory() async {
  return await supabase
      .from('watch_history')
      .select('*, resources(*)')
      .eq('user_id', supabase.auth.currentUser!.id)
      .order('watched_at', ascending: false)
      .limit(20);
}
```

---

## 🔐 Authentication System

Authentication is handled entirely by **Supabase Auth** with custom role management.

### Auth Flow

```
User opens App
      │
      ▼
Check Session (Supabase)
      │
  ┌───┴───────────┐
  │               │
Active Session    No Session
  │               │
  ▼               ▼
Home          Login / Signup Screen
                   │
              ┌────┴────┐
              │         │
           Login       Signup
              │         │
              ▼         ▼
          Verify    Create Account + Set Role
          Creds
              │         │
              └────┬────┘
                   ▼
         Role-Based Redirect
         (Teacher or Student Dashboard)
```

### Role Assignment

```dart
Future<void> signUpWithRole(
    String email, String password, String role, String name) async {
  final response = await supabase.auth.signUp(
    email: email,
    password: password,
    data: {'role': role, 'name': name},
  );

  await supabase.from('users').insert({
    'id': response.user!.id,
    'email': email,
    'role': role,
    'name': name,
  });
}
```

### Security Features

- 🔒 JWT Token-based sessions
- 🛡️ Row Level Security (RLS) on all tables
- 🔐 Role-based data access
- ✉️ Email verification support
- 🔄 Auto token refresh

---

## 📁 File Upload & Storage

All educational files (PDFs, images) are stored in **Supabase Storage**.

### Storage Bucket Structure

```
supabase-storage/
└── education-files/
    ├── pdfs/
    │   ├── sample-papers/
    │   ├── ebooks/
    │   └── resources/
    ├── thumbnails/
    └── avatars/
```

### Upload Implementation

```dart
Future<String> uploadPDF(File file, String fileName) async {
  final bytes = await file.readAsBytes();
  final filePath =
      'pdfs/resources/${DateTime.now().millisecondsSinceEpoch}_$fileName';

  await supabase.storage.from('education-files').uploadBinary(
    filePath,
    bytes,
    fileOptions: FileOptions(contentType: 'application/pdf'),
  );

  return supabase.storage.from('education-files').getPublicUrl(filePath);
}
```

### Storage Access Policies

| Bucket Path | Read Access | Write Access |
|-------------|-------------|--------------|
| `education-files/pdfs` | Authenticated users | Teachers only |
| `education-files/thumbnails` | Public | Teachers only |
| `education-files/avatars` | Public | Own user only |

---

## 📸 Screenshots

> Add your actual screenshots in the `assets/screenshots/` folder.

| Screen | Description |
|--------|-------------|
| Splash Screen | App launch with branding |
| Login / Signup | Role-based authentication screens |
| Student Dashboard | Home screen with sections and quick access |
| Teacher Dashboard | Upload and manage resources |
| AI Tutor | Chat interface with Gemini-powered responses |
| Quiz Screen | Multiple choice quiz with timer |
| Resource Library | Filtered list of videos, PDFs, e-books |
| Watch History | Recently watched content with timestamps |

---

## 🚀 Installation Guide

### Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Flutter | 3.x+ | [flutter.dev](https://flutter.dev) |
| Dart | 3.x+ | Included with Flutter |
| Android Studio or VS Code | Latest | With Flutter plugin |
| Git | Latest | [git-scm.com](https://git-scm.com) |
| Node.js | 18+ | Required for n8n |

---

## 📱 Flutter Setup

**Step 1 — Clone the Repository**

```bash
git clone https://github.com/yourusername/smart-education-app.git
cd smart-education-app
```

**Step 2 — Install Dependencies**

```bash
flutter pub get
```

**Step 3 — Configure Environment**

Create `lib/config/app_config.dart`:

```dart
class AppConfig {
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
  static const String n8nWebhookUrl = 'YOUR_N8N_WEBHOOK_URL';
}
```

**Step 4 — Run the App**

```bash
flutter run
```

---

## 🔧 Supabase Setup

**Step 1 — Create a Project**

Go to [supabase.com](https://supabase.com), create a new project, and note your Project URL and Anon Key.

**Step 2 — Run Database Migrations**

Open the Supabase SQL Editor and run the migration files from `supabase/migrations/`:

```sql
CREATE TABLE education_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE classes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  education_type_id UUID REFERENCES education_types(id),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Continue with full migration file: supabase/migrations/001_initial.sql
```

**Step 3 — Configure Storage Bucket**

```sql
INSERT INTO storage.buckets (id, name, public)
VALUES ('education-files', 'education-files', false);

CREATE POLICY "Authenticated read" ON storage.objects
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Teachers can upload" ON storage.objects
  FOR INSERT WITH CHECK (
    auth.role() = 'authenticated' AND
    (SELECT role FROM users WHERE id = auth.uid()) = 'teacher'
  );
```

**Step 4 — Enable Row Level Security**

```sql
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE watch_history ENABLE ROW LEVEL SECURITY;
```

---

## ⚙️ n8n AI Workflow Setup

**Step 1 — Install n8n**

```bash
# Using npm
npm install -g n8n
n8n start

# Or using Docker
docker run -it --rm --name n8n -p 5678:5678 n8nio/n8n
```

**Step 2 — Open Dashboard**

Navigate to `http://localhost:5678` in your browser.

**Step 3 — Import Workflow**

Go to Workflows → Import from File → select `n8n/workflows/ai-tutor-workflow.json`.

**Step 4 — Add Credentials**

- Gemini AI API: Add your Google AI Studio API key
- Google Sheets: Authenticate with your Google account

**Step 5 — Activate the Workflow**

Toggle the workflow status to Active.

**Step 6 — Copy Webhook URL**

```
https://your-n8n-domain.com/webhook/ai-tutor
```

Paste this into `AppConfig.n8nWebhookUrl`.

---

## 🤖 Android Build & Deployment

**Debug APK**

```bash
flutter build apk --debug
# Output: build/app/outputs/flutter-apk/app-debug.apk
```

**Release APK**

```bash
# Generate signing keystore
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Build release APK
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**App Bundle (Play Store)**

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

## 🍎 iOS Support (Coming Soon)

iOS support is planned for a future release. Once an Apple Developer account is configured:

```bash
# Requires macOS + Xcode
flutter build ios --release
```

---

## 🗂 Folder Structure

```
smart-education-app/
│
├── lib/
│   ├── config/
│   │   ├── app_config.dart          # API keys & environment config
│   │   └── theme.dart               # App-wide dark theme
│   │
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── resource_model.dart
│   │   ├── subject_model.dart
│   │   ├── quiz_model.dart
│   │   └── watch_history_model.dart
│   │
│   ├── services/
│   │   ├── auth_service.dart        # Supabase Auth operations
│   │   ├── supabase_service.dart    # Database CRUD operations
│   │   ├── storage_service.dart     # File upload & retrieval
│   │   ├── ai_tutor_service.dart    # n8n + Gemini AI calls
│   │   └── quiz_service.dart        # Quiz fetch & submit logic
│   │
│   ├── screens/
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   │
│   │   ├── student/
│   │   │   ├── student_home.dart
│   │   │   ├── resource_list.dart
│   │   │   ├── video_player.dart
│   │   │   ├── pdf_viewer.dart
│   │   │   ├── quiz_screen.dart
│   │   │   ├── watch_history.dart
│   │   │   └── ai_tutor_screen.dart
│   │   │
│   │   └── teacher/
│   │       ├── teacher_home.dart
│   │       ├── upload_resource.dart
│   │       ├── manage_subjects.dart
│   │       └── student_analytics.dart
│   │
│   ├── widgets/
│   │   ├── resource_card.dart
│   │   ├── subject_tile.dart
│   │   ├── quiz_question_widget.dart
│   │   └── ai_chat_bubble.dart
│   │
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── resource_provider.dart
│   │   └── quiz_provider.dart
│   │
│   └── main.dart
│
├── supabase/
│   ├── migrations/
│   │   └── 001_initial.sql
│   └── rls_policies.sql
│
├── n8n/
│   └── workflows/
│       └── ai-tutor-workflow.json
│
├── assets/
│   ├── images/
│   ├── icons/
│   └── screenshots/
│
├── android/
├── ios/
├── pubspec.yaml
├── .env.example
└── README.md
```

---

## 🔮 Future Enhancements

| Feature | Priority | Status |
|---------|----------|--------|
| 🍎 iOS Support | High | Planned |
| 📊 Advanced Analytics Dashboard | High | Planned |
| 🌐 Flutter Web Version | Medium | Planned |
| 💬 Live Chat (Teacher–Student) | Medium | Planned |
| 🎙️ Voice-based AI Tutor | High | Planned |
| 📱 Push Notifications | High | Planned |
| 📲 Offline Mode | High | Planned |
| 🏆 Gamification & Badges | Medium | Idea |
| 📅 Study Planner & Timetable | Medium | Idea |
| 🌍 Multi-language Support | Low | Idea |
| 📹 Live Video Classes | Medium | Idea |
| 🤝 Parent Portal | Low | Idea |
| 💳 Premium Subscription Model | Low | Idea |

---

## 🧗 Challenges Faced

### 1. Role-Based Auth with Supabase
**Challenge:** Supabase Auth doesn't natively support custom roles in the JWT. Routing teachers and students to different dashboards required custom logic.

**Solution:** Extended the `users` table with a `role` column and fetched the user profile immediately after login to determine the correct route.

---

### 2. n8n + Gemini AI Integration
**Challenge:** Connecting Flutter to Gemini AI via n8n webhooks required careful request/response formatting and handling streaming vs. synchronous responses.

**Solution:** Used n8n's HTTP Request node in synchronous mode with structured JSON parsing, and added error handling for API rate limits and timeouts.

---

### 3. PDF Upload & Secure Access
**Challenge:** Supabase Storage RLS policies were blocking authenticated users from reading files uploaded by teachers.

**Solution:** Carefully crafted bucket-level and object-level RLS policies — authenticated users can read, but only teachers can write.

---

### 4. YouTube Integration in Flutter
**Challenge:** Embedding YouTube videos while maintaining the dark UI theme and handling orientation changes cleanly.

**Solution:** Used the `youtube_player_flutter` package with a custom overlay matching the app's dark aesthetic and locked landscape mode for the player screen.

---

### 5. Real-time Subscription Performance
**Challenge:** Supabase real-time subscriptions occasionally caused state management issues when multiple stream listeners were active simultaneously.

**Solution:** Implemented proper stream disposal in widget `dispose()` lifecycle methods and adopted Riverpod for centralized, reactive state management.

---

## 📚 Learning Outcomes

| Skill | Level |
|-------|-------|
| Flutter & Dart | Advanced |
| Supabase (Auth, DB, Storage) | Advanced |
| PostgreSQL & Row Level Security | Proficient |
| REST API Integration | Advanced |
| n8n Workflow Automation | Proficient |
| Google Gemini AI API | Proficient |
| Role-based Access Control | Proficient |
| Cloud Storage Architecture | Proficient |
| State Management with Riverpod | Proficient |
| Mobile App Clean Architecture | Advanced |

### Key Takeaways

- Designing secure, scalable backend-as-a-service architectures with Supabase
- Building production AI features with Gemini and orchestrating them through n8n
- Creating maintainable, large-scale Flutter applications with clean architecture patterns
- Managing file storage securely with fine-grained, role-aware access controls
- Implementing real-time data synchronization across multiple concurrent users

---



| Platform | Link |
|----------|------|
| GitHub | https://github.com/Imposter069 |
| LinkedIn | https://www.linkedin.com/in/ayush-kale-905882335/ |
| Email | kaleayush2006@gmail.com |

If you found this project helpful, please **star the repository** ⭐ — it helps a lot!

---

*Built with Flutter, Supabase, Gemini AI & n8n — Smart Education App, empowering learners one lesson at a time.* 🎓
