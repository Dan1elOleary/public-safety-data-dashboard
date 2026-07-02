# Public Safety Data Dashboard

## Overview

This project is a fictional public-safety-style data dashboard designed to demonstrate data analysis, SQL reporting, dashboard planning, and technical documentation skills.

The dashboard uses sample ticket and support data from a fictional SQL Server database to identify trends such as open tickets, high-priority issues, department workload, application access problems, reporting issues, backup failures, and system errors.

This project is designed for IT support, application support, data analyst, public safety technology, junior systems administrator, and junior database support roles.

## Project Purpose

The purpose of this project is to show how raw support ticket data can be transformed into useful operational reporting.

This project demonstrates how SQL queries can be used to answer real business and IT questions, such as:

- How many tickets are currently open?
- Which departments are submitting the most tickets?
- What categories of issues happen most often?
- Which tickets are high priority?
- Are there recurring application or database issues?
- What system activity should be reviewed by IT?

## Important Note

This project uses fictional public-safety-style data only.

No real police, government, employee, citizen, case, criminal justice, or confidential data is used.

## Tools Used

- SQL Server
- T-SQL
- SQL Server Management Studio
- Excel or Power BI
- GitHub
- Markdown

## Dataset

The dataset is based on the fictional `PublicSafetySupportDB` database from my SQL Server Administration Lab.

The fictional database contains:

- Departments
- Application users
- Support tickets
- Ticket categories
- Ticket statuses
- System activity logs

## Dashboard Goals

The goals of this dashboard are to:

- Analyze fictional support ticket data.
- Track open, closed, and high-priority tickets.
- Identify departments with the highest support request volume.
- Identify the most common support issue categories.
- Review recent system activity.
- Highlight issues that may require escalation.
- Present findings in a clear format for technical and non-technical users.

## Dashboard Sections

### 1. Ticket Overview

This section provides a high-level summary of ticket volume and status.

Recommended metrics:

- Total tickets
- Open tickets
- Closed tickets
- In-progress tickets
- High-priority tickets
- Average ticket age

### 2. Tickets by Department

This section shows which departments are submitting the most support requests.

This can help IT identify departments that may need additional support, training, system improvements, or process review.

### 3. Tickets by Category

This section shows the most common types of issues.

Example categories:

- Application Access
- Database Issue
- Password Reset
- Performance Issue
- Reporting Issue
- System Error

### 4. High-Priority Tickets

This section highlights urgent tickets that may affect business operations, application access, reporting, backups, or system availability.

### 5. System Activity Trends

This section reviews system activity events such as:

- Failed backups
- Access denied events
- Application errors
- Password resets
- Successful logins
- System-generated alerts

## Example SQL Queries

### Ticket Count by Status

```sql
SELECT 
    s.StatusName,
    COUNT(t.TicketID) AS TotalTickets
FROM Tickets t
JOIN TicketStatus s ON t.StatusID = s.StatusID
GROUP BY s.StatusName
ORDER BY TotalTickets DESC;
