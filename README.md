# Build a crowd funding website

## Overview

This is an initial version of a crowd funding website homework.
It contains a very simple website that includes:

- models
  - campaigns
  - contributions
  - users
- views and controllers
  - creating, viewing, and editing campaigns
  - creating, viewing and editing users
  - creating contributions
  - re-calculating contributions
- support for administrator functionality
- support for signing in and out
- functionality
  - not much validation
  - simple signin: user signs in by typing a or email address
  - user can only create or edit campaigns when signed in
  - user can only create or edit campaigns if an admin or if you own it
  - user can edit their own user information
  - db validation on email address: cannot be duplicated

