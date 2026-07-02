/*
Project: Public Safety Data Dashboard
File: dashboard-queries.sql
Purpose: SQL queries used to support the fictional public-safety-style dashboard.
Database: PublicSafetySupportDB
*/

USE PublicSafetySupportDB;
GO

/*
Query 1: Ticket Count by Status
Purpose: Shows how many tickets are open, in progress, pending, resolved, or closed.
*/

SELECT 
    s.StatusName,
    COUNT(t.TicketID) AS TotalTickets
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
GROUP BY s.StatusName
ORDER BY TotalTickets DESC;
GO

/*
Query 2: Ticket Count by Department
Purpose: Shows which departments are submitting the most support requests.
*/

SELECT 
    d.DepartmentName,
    COUNT(t.TicketID) AS TotalTickets
FROM Tickets t
JOIN Departments d ON t.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalTickets DESC;
GO

/*
Query 3: Ticket Count by Category
Purpose: Shows the most common types of support issues.
*/

SELECT 
    c.CategoryName,
    COUNT(t.TicketID) AS TotalTickets
FROM Tickets t
JOIN TicketCategories c ON t.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalTickets DESC;
GO

/*
Query 4: High-Priority Tickets
Purpose: Identifies tickets that should be reviewed first.
*/

SELECT 
    t.TicketID,
    t.Title,
    t.Priority,
    s.StatusName,
    d.DepartmentName,
    t.CreatedDate
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
JOIN Departments d ON t.DepartmentID = d.DepartmentID
WHERE t.Priority = 'High'
ORDER BY t.CreatedDate DESC;
GO

/*
Query 5: Open Tickets
Purpose: Shows all tickets that are not closed.
*/

SELECT 
    t.TicketID,
    t.Title,
    t.Priority,
    s.StatusName,
    d.DepartmentName,
    t.CreatedDate
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
JOIN Departments d ON t.DepartmentID = d.DepartmentID
WHERE s.StatusName <> 'Closed'
ORDER BY t.CreatedDate DESC;
GO

/*
Query 6: Average Ticket Age
Purpose: Calculates how long open tickets have been active.
*/

SELECT 
    AVG(DATEDIFF(DAY, t.CreatedDate, GETDATE())) AS AverageOpenTicketAgeDays
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
WHERE s.StatusName <> 'Closed';
GO

/*
Query 7: Ticket Aging Detail
Purpose: Shows the age of each open ticket.
*/

SELECT 
    t.TicketID,
    t.Title,
    s.StatusName,
    t.Priority,
    d.DepartmentName,
    t.CreatedDate,
    DATEDIFF(DAY, t.CreatedDate, GETDATE()) AS TicketAgeDays
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
JOIN Departments d ON t.DepartmentID = d.DepartmentID
WHERE s.StatusName <> 'Closed'
ORDER BY TicketAgeDays DESC;
GO

/*
Query 8: Recent System Activity
Purpose: Shows recent system events that may need review.
*/

SELECT 
    a.ActivityID,
    a.ActivityType,
    a.ActivityDescription,
    a.SourceSystem,
    a.ActivityDate,
    u.Username
FROM SystemActivityLog a
LEFT JOIN ApplicationUsers u ON a.UserID = u.UserID
ORDER BY a.ActivityDate DESC;
GO

/*
Query 9: Access Denied Events
Purpose: Helps identify possible access control or permissions issues.
*/

SELECT 
    a.ActivityID,
    a.ActivityType,
    a.ActivityDescription,
    a.SourceSystem,
    a.ActivityDate,
    u.Username
FROM SystemActivityLog a
LEFT JOIN ApplicationUsers u ON a.UserID = u.UserID
WHERE a.ActivityType = 'AccessDenied'
ORDER BY a.ActivityDate DESC;
GO

/*
Query 10: Backup-Related Events
Purpose: Helps identify backup failures or backup-related alerts.
*/

SELECT 
    a.ActivityID,
    a.ActivityType,
    a.ActivityDescription,
    a.SourceSystem,
    a.ActivityDate
FROM SystemActivityLog a
WHERE a.ActivityType LIKE '%Backup%'
   OR a.ActivityDescription LIKE '%backup%'
ORDER BY a.ActivityDate DESC;
GO

/*
Query 11: Application Error Events
Purpose: Helps identify application issues that may need escalation.
*/

SELECT 
    a.ActivityID,
    a.ActivityType,
    a.ActivityDescription,
    a.SourceSystem,
    a.ActivityDate,
    u.Username
FROM SystemActivityLog a
LEFT JOIN ApplicationUsers u ON a.UserID = u.UserID
WHERE a.ActivityType = 'ApplicationError'
ORDER BY a.ActivityDate DESC;
GO

/*
Query 12: Active Users by Department
Purpose: Shows active application users grouped by department.
*/

SELECT 
    d.DepartmentName,
    COUNT(u.UserID) AS ActiveUsers
FROM ApplicationUsers u
JOIN Departments d ON u.DepartmentID = d.DepartmentID
WHERE u.IsActive = 1
GROUP BY d.DepartmentName
ORDER BY ActiveUsers DESC;
GO
