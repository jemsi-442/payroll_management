<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name') }} - @yield('title')</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    {{-- Tailwind CSS --}}
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    {{-- Google Fonts --}}
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    {{-- Font Awesome --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    {{-- Chart.js --}}
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        * { font-family: 'Poppins', sans-serif; }

        :root {
            --brand-navy: #0B1F3A;
            --brand-navy-2: #132b50;
            --brand-royal: #1E3A8A;
            --brand-royal-2: #162f6b;
            --brand-accent: #22D3EE;
        }

        .sidebar { background: linear-gradient(135deg, var(--brand-navy) 0%, var(--brand-navy-2) 100%); transition: width 0.3s ease-in-out; width: 256px; }
        .sidebar.collapsed { width: 64px; }
        .sidebar.collapsed .sidebar-text { display: none; }
        .sidebar.collapsed .sidebar-link { justify-content: center; padding: 0.75rem 0; }
        .sidebar-text { visibility: visible; opacity: 1; transition: visibility 0s linear 0.2s, opacity 0.2s ease-in-out 0.2s; animation: fadeIn 0.2s ease-in-out; }
        .sidebar-link { transition: all 0.2s; padding: 0.75rem 1rem; border-radius: 0.375rem; display: flex; align-items: center; }
        .sidebar-link:hover { background-color: rgba(255, 255, 255, 0.1); }
        .sidebar-link.active { background: linear-gradient(135deg, var(--brand-royal) 0%, var(--brand-royal-2) 100%); }
        .sidebar.collapsed .sidebar-link.active { border-radius: 0.375rem; width: 48px; margin: 0 auto; }
        .card { transition: all 0.3s ease; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); background: white; border-radius: 0.75rem; padding: 1.5rem; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); }
        .btn-primary { background: linear-gradient(135deg, var(--brand-royal) 0%, var(--brand-royal-2) 100%); color: white; padding: 0.75rem 1.5rem; border-radius: 0.5rem; font-weight: 600; transition: all 0.2s; box-shadow: 0 2px 4px rgba(30, 58, 138, 0.2); }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); }
        .status-badge { display: inline-flex; align-items: center; padding: 0.4em 0.8em; border-radius: 9999px; font-size: 0.75rem; font-weight: 600; line-height: 1; }
        .status-pending { background-color: #fffbeb; color: #f59e0b; }
        .status-paid { background-color: #d1fae5; color: #10b981; }
        .status-processing { background-color: #dbeafe; color: #3b82f6; }
        .payroll-badge { background: linear-gradient(135deg, var(--brand-royal) 0%, var(--brand-royal-2) 100%); color: white; }
        .stat-card-icon { width: 48px; height: 48px; border-radius: 12px; display: flex; align-items: center; justify-content: center; }
        .nav-item { transition: all 0.2s; }
        .nav-item:hover { background-color: #f3f4f6; border-radius: 0.5rem; }
        .header { background: #ffffff; border-bottom: 1px solid #e5e7eb; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05); padding: 1rem 2rem; }
        .main-content { transition: margin-left 0.3s ease-in-out; }
        .main-content.collapsed { margin-left: 64px; }
        .modal-content { transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out; }
        #addEmployeeModal:not(.hidden) .modal-content, #editEmployeeModal:not(.hidden) .modal-content,
        #deactivateConfirmModal:not(.hidden) .modal-content, #deleteConfirmModal:not(.hidden) .modal-content,
        #viewEmployeeModal:not(.hidden) .modal-content { transform: scale(1); opacity: 1; }
        #addEmployeeModal.hidden .modal-content, #editEmployeeModal.hidden .modal-content,
        #deactivateConfirmModal.hidden .modal-content, #deleteConfirmModal.hidden .modal-content,
        #viewEmployeeModal.hidden .modal-content { transform: scale(0.95); opacity: 0; }
        .notification-container { position: fixed; top: 20px; right: 20px; z-index: 1000; width: 350px; }
        .notification { background: white; border-radius: 12px; padding: 0; margin-bottom: 12px; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15); overflow: hidden; animation: slideIn 0.4s ease-in-out; border-left: 5px solid; }
        .notification.success { border-left-color: #10b981; }
        .notification.error { border-left-color: #ef4444; }
        .notification.warning { border-left-color: #f59e0b; }
        .notification.info { border-left-color: #3b82f6; }
        .notification-header { padding: 12px 16px; background: linear-gradient(135deg, var(--brand-navy) 0%, var(--brand-navy-2) 100%); color: white; display: flex; align-items: center; justify-content: space-between; }
        .notification-sender { font-weight: 600; font-size: 14px; display: flex; align-items: center; }
        .notification-sender i { margin-right: 8px; }
        .notification-time { font-size: 11px; opacity: 0.8; }
        .notification-body { padding: 14px 16px; color: #374151; font-size: 13px; line-height: 1.4; }
        .notification-actions { padding: 10px 16px; background: #f9fafb; display: flex; justify-content: space-between; align-items: center; border-top: 1px solid #e5e7eb; }
        .notification-category { font-size: 11px; color: #6b7280; font-weight: 500; }
        .notification-close { background: none; border: none; color: #6b7280; cursor: pointer; padding: 4px; border-radius: 4px; transition: all 0.2s; }
        .notification-close:hover { background: #e5e7eb; color: #374151; }
        .logo-container { width: 100%; display: flex; align-items: center; justify-content: center; padding: 8px 16px; }
        .logo-container img { width: 100%; max-height: 64px; object-fit: contain; }
        .sidebar.collapsed .logo-container { padding: 8px; }
        .sidebar.collapsed .logo-container img { max-height: 48px; }
        @keyframes slideIn { 
            from { transform: translateX(100%); opacity: 0; } 
            to { transform: translateX(0); opacity: 1; } 
        }
        @keyframes slideOut { 
            from { transform: translateX(0); opacity: 1; } 
            to { transform: translateX(100%); opacity: 0; } 
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateX(-10px); } to { opacity: 1; transform: translateX(0); } }
        @media (max-width: 768px) {
            .sidebar { width: 256px; transform: translateX(-100%); position: fixed; z-index: 50; height: 100vh; }
            .sidebar.active { transform: translateX(0); }
            .sidebar.collapsed { transform: translateX(-100%); }
            .main-content { margin-left: 0; }
            .main-content.collapsed { margin-left: 0; }
            .notification-container { width: 90%; right: 5%; }
            .logo-container { padding: 8px; }
            .logo-container img { max-height: 48px; }
        }
        /* Native date input styling to match design */
        input[type="date"], input[type="month"], input[type="number"] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            width: 100%;
            min-width: 10rem;
            padding: 0.625rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-family: 'Poppins', sans-serif;
            font-size: 0.875rem;
            color: #374151;
            background-color: #fff;
            transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        input[type="date"]:focus, input[type="month"]:focus, input[type="number"]:focus {
            outline: none;
            border-color: var(--brand-royal);
            box-shadow: 0 0 0 3px rgba(34, 211, 238, 0.25);
        }
        input[type="date"]::-webkit-calendar-picker-indicator,
        input[type="month"]::-webkit-calendar-picker-indicator {
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%236b7280'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z'/%3E%3C/svg%3E") no-repeat center;
            background-size: 1.5rem;
            width: 1.5rem;
            height: 1.5rem;
            cursor: pointer;
            opacity: 0.6;
        }
        input[type="date"]::-webkit-calendar-picker-indicator:hover,
        input[type="month"]::-webkit-calendar-picker-indicator:hover {
            opacity: 1;
        }
        .animate-spin {
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .flatpickr-input[readonly] {
            background-color: #f9fafb;
            cursor: pointer;
        }

        /* Brand theme: remap Tailwind "green" accents to JAYFOUR brand */
        .text-green-500 { color: var(--brand-royal) !important; }
        .text-green-600 { color: var(--brand-royal) !important; }
        .text-green-700 { color: var(--brand-royal-2) !important; }
        .text-green-800 { color: var(--brand-navy) !important; }
        .text-green-100 { color: #ecfeff !important; }

        .bg-green-50 { background-color: #ecfeff !important; }
        .bg-green-100 { background-color: #cffafe !important; }
        .bg-green-200 { background-color: #a5f3fc !important; }
        .bg-green-500 { background-color: var(--brand-accent) !important; }
        .bg-green-600 { background-color: var(--brand-royal) !important; }
        .bg-green-700 { background-color: var(--brand-royal-2) !important; }

        .border-green-200 { border-color: #a5f3fc !important; }
        .border-green-400 { border-color: var(--brand-accent) !important; }
        .border-green-500 { border-color: var(--brand-royal) !important; }
        .border-green-600 { border-color: var(--brand-royal) !important; }

        .hover\\:bg-green-50:hover { background-color: #ecfeff !important; }
        .hover\\:bg-green-100:hover { background-color: #cffafe !important; }
        .hover\\:bg-green-200:hover { background-color: #a5f3fc !important; }
        .hover\\:bg-green-700:hover { background-color: var(--brand-royal-2) !important; }
        .hover\\:text-green-700:hover { color: var(--brand-royal-2) !important; }
        .hover\\:text-green-800:hover { color: var(--brand-navy) !important; }

        .focus\\:ring-green-300:focus { --tw-ring-color: rgba(34, 211, 238, 0.35) !important; }
        .focus\\:ring-green-500:focus { --tw-ring-color: rgba(34, 211, 238, 0.45) !important; }
        .focus\\:border-green-500:focus { border-color: var(--brand-royal) !important; }
        .focus\\:border-green-600:focus { border-color: var(--brand-royal) !important; }

        .from-green-50 {
            --tw-gradient-from: #ecfeff !important;
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to, rgba(236, 254, 255, 0)) !important;
        }
        .to-green-100 { --tw-gradient-to: #cffafe !important; }
        .from-green-500 {
            --tw-gradient-from: var(--brand-royal) !important;
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to, rgba(30, 58, 138, 0)) !important;
        }
        .to-green-600 { --tw-gradient-to: var(--brand-royal-2) !important; }
        .from-green-600 {
            --tw-gradient-from: var(--brand-royal) !important;
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to, rgba(30, 58, 138, 0)) !important;
        }
        .to-green-700 { --tw-gradient-to: var(--brand-royal-2) !important; }

        .border-t-green-600 { border-top-color: var(--brand-royal) !important; }
    </style>
</head>
<body class="bg-gray-50">
    <div class="flex min-h-screen">
        <div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-40 hidden" style="z-index: 40;"></div>
        <div class="sidebar text-white p-6 flex flex-col fixed h-full overflow-y-auto" id="sidebar">
            <div class="flex items-center mb-10 justify-center">
                <div class="logo-container">
                    <img src="{{ asset('assets/banner.jpg') }}" alt="{{ config('app.name') }} Logo" class="h-10 w-auto">
                </div>
            </div>
            <nav class="flex-1">
                <ul class="space-y-2">
                    @php $userRole = Auth::user(); @endphp

                    @if($userRole && in_array(strtolower($userRole->role), ['admin', 'hr', 'hr manager'], true))
                        {{-- Admin / HR Links --}}
                        <li><a href="{{ route('dashboard') }}" class="sidebar-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"><i class="fas fa-tachometer-alt mr-3"></i><span class="sidebar-text">Dashboard</span></a></li>
                        <li><a href="{{ route('employees.index') }}" class="sidebar-link {{ request()->routeIs('employees*') ? 'active' : '' }}"><i class="fas fa-users mr-3"></i><span class="sidebar-text">Employees</span></a></li>
                        <li><a href="{{ route('payroll') }}" class="sidebar-link {{ request()->routeIs('payroll*') ? 'active' : '' }}"><i class="fas fa-file-invoice-dollar mr-3"></i><span class="sidebar-text">Payroll</span></a></li>
                        <li><a href="{{ route('reports') }}" class="sidebar-link {{ request()->routeIs('reports*') ? 'active' : '' }}"><i class="fas fa-chart-bar mr-3"></i><span class="sidebar-text">Reports</span></a></li>
                        <li><a href="{{ route('compliance.index') }}" class="sidebar-link {{ request()->routeIs('compliance*') ? 'active' : '' }}"><i class="fas fa-shield-alt mr-3"></i><span class="sidebar-text">Compliance</span></a></li>
                        <li><a href="{{ route('dashboard.attendance') }}" class="sidebar-link {{ request()->routeIs('dashboard.attendance') ? 'active' : '' }}"><i class="fas fa-clock mr-3"></i><span class="sidebar-text">Attendance</span></a></li>
                        <li><a href="{{ route('employee.portal') }}" class="sidebar-link {{ request()->routeIs('employee.portal') ? 'active' : '' }}"><i class="fas fa-user-circle mr-3"></i><span class="sidebar-text">Employee Portal</span></a></li>
                        <li><a href="{{ route('settings.index') }}" class="sidebar-link {{ request()->routeIs('settings*') ? 'active' : '' }}"><i class="fas fa-cog mr-3"></i><span class="sidebar-text">Settings</span></a></li>
                    @elseif($userRole)
                        {{-- Employee Links --}}
                        <li><a href="{{ route('portal.attendance') }}" class="sidebar-link {{ request()->routeIs('portal.attendance') ? 'active' : '' }}"><i class="fas fa-clock mr-3"></i><span class="sidebar-text">My Attendance</span></a></li>
                        <li><a href="{{ route('employee.portal') }}" class="sidebar-link {{ request()->routeIs('employee.portal') ? 'active' : '' }}"><i class="fas fa-user-circle mr-3"></i><span class="sidebar-text">Employee Portal</span></a></li>
                    @endif
                </ul>
            </nav>
        </div>

        <main class="ml-64 flex-1 overflow-y-auto main-content" id="main-content">
            <header class="header flex flex-col sm:flex-row sm:justify-between sm:items-center gap-3">
                <div class="flex items-start sm:items-center">
                    <button id="toggleSidebar" aria-label="Toggle Sidebar" class="text-gray-600 hover:text-gray-800 mr-4 focus:outline-none mt-1 sm:mt-0">
                        <i class="fas fa-bars text-xl"></i>
                    </button>
                    <div>
                        <h2 class="text-2xl font-semibold text-gray-800">@yield('header-title')</h2>
                        <p class="text-sm text-gray-600">@yield('header-subtitle')</p>
                    </div>
                </div>
                <div class="flex flex-wrap items-center gap-3">
                    <div class="relative">
                        <button id="notificationToggle" class="fas fa-bell text-gray-500 text-xl focus:outline-none"></button>
                        <span id="notificationDot" class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full hidden"></span>
                    </div>
                    <div class="text-sm text-gray-600 hidden md:block">
                        {{ \Carbon\Carbon::now()->format('l, F d, Y') }}
                    </div>
                    <div class="flex items-center">
                        <div class="w-8 h-8 rounded-full bg-cyan-500 flex items-center justify-center mr-2">
                            <i class="fas fa-user text-white"></i>
                        </div>
                        <div>
                            <p class="text-sm font-medium text-gray-800">{{ $userRole ? $userRole->name : 'Guest' }}</p>
                            <p class="text-xs text-gray-500">{{ $userRole ? ucfirst($userRole->role ?? 'Employee') : 'Guest' }}</p>
                        </div>
                    </div>
                    @if($userRole)
                        <a href="#"
                           onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                           class="text-gray-600 hover:text-cyan-600 p-2 rounded-full hover:bg-gray-100 transition">
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    @else
                        <a href="{{ route('login') }}"
                           class="text-gray-600 hover:text-cyan-600 p-2 rounded-full hover:bg-gray-100 transition">
                            <i class="fas fa-sign-in-alt"></i>
                        </a>
                    @endif
                </div>
            </header>

            <div class="notification-container" id="notificationContainer"></div>

            <div class="p-4 sm:p-6 lg:p-8">
                @yield('content')
            </div>
        </main>
    </div>

    @yield('modals')

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');
            const toggleButton = document.getElementById('toggleSidebar');
            const toggleIcon = toggleButton.querySelector('i');
            const sidebarOverlay = document.getElementById('sidebar-overlay');
            const notificationToggle = document.getElementById('notificationToggle');
            const notificationDot = document.getElementById('notificationDot');
            const notificationContainer = document.getElementById('notificationContainer');

            function isMobile() {
                return window.innerWidth <= 768;
            }

            function updateSidebarOverlay() {
                if (!sidebarOverlay) return;
                const shouldShow = isMobile() && sidebar.classList.contains('active') && !sidebar.classList.contains('collapsed');
                sidebarOverlay.classList.toggle('hidden', !shouldShow);
            }

            function closeMobileSidebar() {
                if (!isMobile()) return;
                sidebar.classList.add('collapsed');
                sidebar.classList.remove('active');
                mainContent.classList.add('collapsed');
                toggleIcon.classList.remove('fa-times');
                toggleIcon.classList.add('fa-bars');
                updateSidebarOverlay();
            }

            // Sidebar toggle
            toggleButton.addEventListener('click', function() {
                sidebar.classList.toggle('collapsed');
                mainContent.classList.toggle('collapsed');

                if (sidebar.classList.contains('collapsed')) {
                    toggleIcon.classList.remove('fa-times');
                    toggleIcon.classList.add('fa-bars');
                    sidebar.classList.remove('active');
                } else {
                    toggleIcon.classList.remove('fa-bars');
                    toggleIcon.classList.add('fa-times');
                    if (window.innerWidth <= 768) {
                        sidebar.classList.add('active');
                    }
                }

                updateSidebarOverlay();
            });

            if (window.innerWidth <= 768) {
                sidebar.classList.add('collapsed');
                sidebar.classList.remove('active');
                mainContent.classList.add('collapsed');
            }

            updateSidebarOverlay();

            if (sidebarOverlay) {
                sidebarOverlay.addEventListener('click', closeMobileSidebar);
            }

            // Close on ESC (mobile)
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    closeMobileSidebar();
                }
            });

            // Close sidebar after clicking a nav link (mobile)
            sidebar.addEventListener('click', function(e) {
                const link = e.target.closest('a');
                if (link && isMobile()) {
                    closeMobileSidebar();
                }
            });

            // Keep state sane on resize
            window.addEventListener('resize', function() {
                if (!isMobile()) {
                    if (sidebarOverlay) sidebarOverlay.classList.add('hidden');
                    sidebar.classList.remove('active');
                } else {
                    // When entering mobile, ensure sidebar starts hidden
                    sidebar.classList.add('collapsed');
                    sidebar.classList.remove('active');
                    mainContent.classList.add('collapsed');
                    toggleIcon.classList.remove('fa-times');
                    toggleIcon.classList.add('fa-bars');
                    updateSidebarOverlay();
                }
            });

            // Notification system
            let notifications = [];

            function showNotification(message, type = 'success', category = 'System') {
                const now = new Date();
                const timeString = now.toLocaleTimeString('en-US', { 
                    hour: '2-digit', 
                    minute: '2-digit',
                    hour12: true 
                });

                const notification = document.createElement('div');
                notification.className = `notification ${type}`;
                notification.innerHTML = `
                    <div class="notification-header">
                        <div class="notification-sender">
                            <i class="fas ${getNotificationIcon(type)}"></i>
                            {{ config('app.name') }}
                        </div>
                        <div class="notification-time">${timeString}</div>
                    </div>
                    <div class="notification-body">
                        ${message}
                    </div>
                    <div class="notification-actions">
                        <span class="notification-category">${category}</span>
                        <button class="notification-close">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                `;
                
                notificationContainer.appendChild(notification);
                notifications.push(notification);

                // Auto-remove after 6 seconds
                setTimeout(() => {
                    if (notification.parentNode) {
                        notification.style.animation = 'slideOut 0.3s ease-in-out';
                        setTimeout(() => {
                            notification.remove();
                            notifications = notifications.filter(n => n !== notification);
                            updateNotificationDot();
                        }, 300);
                    }
                }, 6000);

                // Manual close
                const closeBtn = notification.querySelector('.notification-close');
                closeBtn.addEventListener('click', () => {
                    notification.style.animation = 'slideOut 0.3s ease-in-out';
                    setTimeout(() => {
                        notification.remove();
                        notifications = notifications.filter(n => n !== notification);
                        updateNotificationDot();
                    }, 300);
                });

                updateNotificationDot();
            }

            function getNotificationIcon(type) {
                const icons = {
                    'success': 'fa-check-circle',
                    'error': 'fa-exclamation-circle',
                    'warning': 'fa-exclamation-triangle',
                    'info': 'fa-info-circle'
                };
                return icons[type] || 'fa-bell';
            }

            function updateNotificationDot() {
                notificationDot.classList.toggle('hidden', notifications.length === 0);
            }

            notificationToggle.addEventListener('click', () => {
                if (notifications.length === 0) {
                    showNotification('No new notifications available', 'info', 'System');
                }
            });

            // Handle Laravel flash messages with appropriate categories
            @if(session('success'))
                showNotification("{{ session('success') }}", 'success', getMessageCategory("{{ session('success') }}"));
            @endif
            
            @if(session('error'))
                showNotification("{{ session('error') }}", 'error', getMessageCategory("{{ session('error') }}"));
            @endif
            
            @if(session('warning'))
                showNotification("{{ session('warning') }}", 'warning', getMessageCategory("{{ session('warning') }}"));
            @endif
            
            @if(session('info'))
                showNotification("{{ session('info') }}", 'info', getMessageCategory("{{ session('info') }}"));
            @endif

            // Function to determine message category based on content
            function getMessageCategory(message) {
                const lowerMessage = message.toLowerCase();
                
                if (lowerMessage.includes('payroll') || lowerMessage.includes('salary') || lowerMessage.includes('payment')) {
                    return 'Payroll';
                } else if (lowerMessage.includes('attendance') || lowerMessage.includes('check-in') || lowerMessage.includes('check-out')) {
                    return 'Attendance';
                } else if (lowerMessage.includes('leave') || lowerMessage.includes('likizo')) {
                    return 'Leave';
                } else if (lowerMessage.includes('report') || lowerMessage.includes('ripoti')) {
                    return 'Reports';
                } else if (lowerMessage.includes('employee') || lowerMessage.includes('mfanyakazi')) {
                    return 'Employee';
                } else if (lowerMessage.includes('sync') || lowerMessage.includes('biometric')) {
                    return 'System';
                } else {
                    return 'System';
                }
            }

            // Add clickable functionality to notifications
            document.addEventListener('click', function(e) {
                if (e.target.closest('.notification')) {
                    const notification = e.target.closest('.notification');
                    const message = notification.querySelector('.notification-body').textContent;
                    
                    // Navigate based on notification content
                    if (message.includes('payroll') || message.includes('salary')) {
                        window.location.href = "{{ route('payroll') }}";
                    } else if (message.includes('attendance')) {
                        window.location.href = "{{ route('dashboard.attendance') }}";
                    } else if (message.includes('leave')) {
                        window.location.href = "{{ route('dashboard.attendance') }}#leave-requests";
                    } else if (message.includes('report')) {
                        window.location.href = "{{ route('reports') }}";
                    } else if (message.includes('employee portal')) {
                        window.location.href = "{{ route('employee.portal') }}";
                    }
                }
            });
        });
    </script>
</body>
</html>
