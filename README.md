# UniiBridge

A study-abroad information platform built with Flutter and Supabase, providing structured data on top universities across the UK, USA, Canada, and Australia to help students research and compare options.

## 🖼️ Screenshots

(Study_Abroad_Application/unibridge/Asset/View_App/)

## ✨ Key Features

- **Structured university data** — top 5 universities across 4 countries (UK, USA, Canada, Australia), covering 20 universities total
- **Supabase-backed database** — relational schema for querying and filtering university data
- **Production recovery** — restored a paused Supabase project from scratch, including database restoration via `psql`/Session Pooler and manual storage recovery
- **Automated uptime** — GitHub Actions cron workflow keeps the free-tier backend from auto-pausing

## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Supabase (PostgreSQL, Storage)
- **DevOps:** GitHub Actions (scheduled keep-alive workflow)

## 🚀 Getting Started

```bash
git clone https://github.com/[username]/uniibridge.git
cd uniibridge
flutter pub get
flutter run
```

## 📄 License

<!-- Add your license here, e.g. MIT -->


### Future Improvements
- Firebase authentication
- Google & Facebook sign-in
- Forgot password flow
- Country, university, and details pages (modules 2–4)
- Dashboard and profile pages
