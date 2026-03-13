# JAYFOUR DIGITAL SOLUTIONS - Payroll Management

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Laravel](https://img.shields.io/badge/Laravel-12.x-red?logo=laravel)
![PHP](https://img.shields.io/badge/PHP-8.2%2B-blue?logo=php)
![Tailwind CSS](https://img.shields.io/badge/TailwindCSS-4.x-teal?logo=tailwind-css)

A modern, responsive **HR & Payroll Dashboard** built with **Laravel Blade**, **Tailwind CSS**, and **JavaScript**, designed for **administrators, HR managers, and employees**. The system features employee management, payroll processing, attendance tracking, reports, compliance, notifications, and a user-friendly employee portal.

## Features

- **User Roles & Permissions**
  - Admin / HR Manager: Full dashboard access
  - Employee: Limited portal & attendance access
- **Employee Management**
  - Add, edit, deactivate employees
  - Employee profiles & details
- **Payroll System**
  - Generate payroll
  - Status badges (Paid, Pending, Processing)
- **Attendance & Leave Tracking**
  - Employee check-in/out
  - Leave requests and approvals
- **Reports & Compliance**
  - Generate reports by category
  - Compliance tracking
- **Notifications**
  - Real-time system notifications
  - Clickable notifications with automatic routing
- **Responsive Design**
  - Fully responsive using **Tailwind CSS**
  - Works on desktop and mobile devices

## Tech Stack

- **Backend:** Laravel (Blade templating engine)
- **Frontend:** Tailwind CSS, Font Awesome, Flatpickr, Chart.js
- **Database:** MySQL / MariaDB
- **Utilities:** JavaScript for sidebar toggle, notifications, and modal animations
- **Fonts:** Google Fonts (Poppins)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jemsi-442/payroll_management.git
   cd payroll_management
   ```

2. **Install dependencies**
   ```bash
   composer install
   ```

3. **Create environment file**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

4. **Configure database**
   - Update `DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` in `.env`
   - Or set `DATABASE_URL` / `DB_URL` (connection string)

5. **Run migrations**
   ```bash
   php artisan migrate
   ```

6. **Start locally**
   ```bash
   php artisan serve
   ```

## Deploy to Railway

1. **Create a new Railway project**
   - Connect this GitHub repo
   - Railway will use the included `Dockerfile`

2. **Set environment variables (Railway → Variables)**
   - `APP_NAME="JAYFOUR DIGITAL SOLUTIONS"`
   - `APP_ENV=production`
   - `APP_DEBUG=false`
   - `APP_KEY=...` (generate with `php artisan key:generate --show`)
   - `APP_URL=...` (your Railway domain)
   - Database (choose one):
     - Set `DATABASE_URL` (recommended) or `DB_URL`
     - Or set `DB_CONNECTION` + `DB_HOST` + `DB_PORT` + `DB_DATABASE` + `DB_USERNAME` + `DB_PASSWORD`
   - `LOG_CHANNEL=stderr`

3. **Run migrations on deploy**
   - Run once: `php artisan migrate --force`
