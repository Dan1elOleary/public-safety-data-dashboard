# Dashboard Build Guide

## Purpose

This document explains how the Public Safety Data Dashboard would be built using SQL Server data and a reporting tool such as Excel or Power BI.

## Step 1: Prepare the Database

Use the `PublicSafetySupportDB` database from the SQL Server Administration Lab.

Confirm the following tables exist:

- Departments
- ApplicationUsers
- TicketCategories
- TicketStatus
- Tickets
- SystemActivityLog

## Step 2: Run SQL Queries

Use the queries in:

```text
sql-queries/dashboard-queries.sql
