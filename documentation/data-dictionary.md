
---

# `documentation/data-dictionary.md`

```markdown
# Data Dictionary

## Purpose

This document explains the fictional database fields used in the Public Safety Data Dashboard.

## Departments Table

| Field | Description |
|---|---|
| DepartmentID | Unique department identifier |
| DepartmentName | Name of the fictional department |
| LocationName | Fictional location name |

## ApplicationUsers Table

| Field | Description |
|---|---|
| UserID | Unique user identifier |
| FirstName | Fictional first name |
| LastName | Fictional last name |
| Username | Fictional username |
| DepartmentID | Department assigned to the user |
| IsActive | Shows whether the user account is active |
| CreatedDate | Date the user record was created |

## TicketCategories Table

| Field | Description |
|---|---|
| CategoryID | Unique category identifier |
| CategoryName | Type of support issue |

## TicketStatus Table

| Field | Description |
|---|---|
| StatusID | Unique status identifier |
| StatusName | Current ticket status |

## Tickets Table

| Field | Description |
|---|---|
| TicketID | Unique ticket identifier |
| Title | Short ticket title |
| Description | Ticket description |
| CategoryID | Ticket category |
| StatusID | Ticket status |
| DepartmentID | Department that submitted the ticket |
| RequestedByUserID | User who submitted the ticket |
| Priority | Ticket priority |
| CreatedDate | Date ticket was created |
| ClosedDate | Date ticket was closed, if applicable |

## SystemActivityLog Table

| Field | Description |
|---|---|
| ActivityID | Unique activity log identifier |
| UserID | User connected to the activity, if applicable |
| ActivityType | Type of system activity |
| ActivityDescription | Description of the activity |
| SourceSystem | System where the activity originated |
| ActivityDate | Date and time of the activity |

## Data Privacy Note

All data in this project is fictional. No real employee, citizen, police, government, criminal justice, or confidential data is used.
