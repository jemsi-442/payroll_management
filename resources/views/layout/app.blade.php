<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jayfour Digital Solution - Payroll Management System</title>

<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    * {
        font-family: 'Poppins', sans-serif;
    }

    /* ===== BRAND COLORS ===== */
    :root {
        --navy: #0B1F3A;         /* Deep Navy */
        --royal: #1E3A8A;        /* Royal Blue */
        --cyan: #22D3EE;         /* Soft Electric Cyan */
        --light: #F9FAFB;
        --card-bg: #FFFFFF;
    }

    body {
        background-color: var(--light);
    }

    /* ===== SIDEBAR ===== */
    .sidebar {
        background: linear-gradient(135deg, var(--navy) 0%, #132b50 100%);
        box-shadow: 4px 0 20px rgba(0,0,0,0.15);
    }

    .sidebar-link {
        transition: all 0.3s ease;
        padding: 0.75rem 1rem;
        border-radius: 0.5rem;
        display: flex;
        align-items: center;
        color: #e5e7eb;
    }

    .sidebar-link:hover {
        background: rgba(34, 211, 238, 0.15);
        box-shadow: 0 0 10px rgba(34, 211, 238, 0.4);
    }

    .sidebar-link.active {
        background: linear-gradient(135deg, var(--royal), #162f6b);
        box-shadow: 0 0 12px rgba(34, 211, 238, 0.6);
    }

    /* ===== CARDS ===== */
    .card {
        background: var(--card-bg);
        border-radius: 1rem;
        padding: 1.5rem;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        border: 1px solid #e5e7eb;
    }

    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
    }

    /* ===== PRIMARY BUTTON ===== */
    .btn-primary {
        background: linear-gradient(135deg, var(--royal), #162f6b);
        color: white;
        padding: 0.75rem 1.5rem;
        border-radius: 0.75rem;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 4px 10px rgba(30, 58, 138, 0.3);
    }

    .btn-primary:hover {
        transform: translateY(-3px);
        box-shadow: 0 0 15px rgba(34, 211, 238, 0.8);
    }

    /* ===== STATUS BADGES ===== */
    .status-badge {
        display: inline-flex;
        align-items: center;
        padding: 0.4em 0.8em;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 600;
    }

    .status-paid {
        background-color: rgba(34, 211, 238, 0.1);
        color: var(--royal);
    }

    .status-pending {
        background-color: #FEF3C7;
        color: #B45309;
    }

    .status-processing {
        background-color: #DBEAFE;
        color: var(--royal);
    }

    /* ===== ICON STYLE ===== */
    .stat-card-icon {
        width: 48px;
        height: 48px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(34, 211, 238, 0.15);
        color: var(--royal);
        box-shadow: 0 0 12px rgba(34, 211, 238, 0.5);
    }

    /* ===== NAV ITEM ===== */
    .nav-item:hover {
        background-color: #f3f4f6;
        border-radius: 0.75rem;
        transition: all 0.2s ease;
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
        .sidebar {
            transform: translateX(-100%);
            position: fixed;
            z-index: 50;
            height: 100vh;
        }
        .sidebar.active {
            transform: translateX(0);
        }
        .main-content {
            margin-left: 0;
        }
    }
</style>
</head>

<body class="bg-gray-50">
@yield('content')
</body>
</html>
