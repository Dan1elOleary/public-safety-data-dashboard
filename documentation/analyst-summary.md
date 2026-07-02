# Analyst Summary

## Overview

This dashboard analyzes fictional public-safety-style support ticket and system activity data.

The goal is to identify operational trends, high-priority issues, recurring problems, and areas where IT support may need to focus attention.

## Key Findings

### 1. High-Priority Issues Require Immediate Review

High-priority tickets may involve application access problems, database issues, backup failures, or application errors.

These issues should be reviewed first because they may affect user productivity, system availability, reporting accuracy, or recovery capability.

### 2. Department Workload Can Show Support Demand

Ticket volume by department helps identify where IT support requests are coming from most often.

A department with a higher number of tickets may need:

- Additional training
- Better documentation
- Application improvements
- Permission review
- Hardware or software support

### 3. Ticket Categories Help Identify Recurring Problems

Ticket categories help IT understand what types of issues happen most often.

For example:

- Repeated application access tickets may indicate onboarding or permission problems.
- Repeated performance tickets may indicate slow queries, indexing issues, or application problems.
- Repeated reporting tickets may indicate data refresh or dashboard configuration problems.

### 4. System Activity Logs Support Troubleshooting

System activity logs can help identify events that may require further investigation.

Important activity types include:

- Access denied events
- Backup job failures
- Application errors
- Password reset activity
- Login activity

### 5. Backup Events Should Be Treated Seriously

Backup-related failures should be reviewed quickly because backups are important for disaster recovery.

If a backup fails, IT should confirm:

- The backup path exists.
- The SQL Server service account has permission.
- There is enough disk space.
- The backup job completed successfully after remediation.
- A restore test is performed when needed.

## Recommended Actions

Based on the dashboard, the recommended IT actions are:

1. Review all high-priority tickets first.
2. Investigate backup-related system activity.
3. Review access denied events for possible permission problems.
4. Monitor departments with higher ticket volume.
5. Review recurring performance-related tickets.
6. Continue improving documentation for common user issues.
7. Add dashboard screenshots and trend visuals after building the report.

## Skills Demonstrated

This project demonstrates:

- SQL analysis
- Dashboard planning
- Ticket trend analysis
- Technical documentation
- Operational reporting
- Application support awareness
- Data-driven troubleshooting
- Ability to explain technical findings clearly
