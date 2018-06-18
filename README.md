# Subway Scheduler

Subway Scheduler saves your commonly used addresses and fetches directions between them from the Google Maps API.

## Usage

Please follow the instructions below to clone the subway-scheduler repository, start the server, and navigate to http://localhost:3000 in your browser. At the landing page you have the option to Sign in via Google, or sign up with an email and password. Once logged in, users will be redirected to their user page, where they can create new routes between two addresses, or single addresses.

### Create a new route:

Here, the user can create a new route between two addresses in New York City. A route can be created using previously entered addresses (via a pulldown menu) or by entering new addresses.

### Create a new address:

Here, the user can create a single address.

### View a route:

Users can view a route (two addresses), as well as transit directions between them (fetched via Google Maps API).

### View an address:

Users can view an address, as well as all routes to which that address belongs. Also shown are all users who have that address in one of their routes.

### View all routes:

Here, all routes for a user (accessed via /users/:user_id/routes) or the logged-in user's routes (via /routes) are visible, with their origin and destination addresses.

### View all addresses:

Here, all addresses are visible, and are filterable by Borough.


## Installation

```
git clone git@github.com:skalum/subway-scheduler.git
cd subway-scheduler
rails db:migrate
rails s
```
Navigate on a browser to: http://localhost:3000

## Contributors

Creating an issue:

Under this repository, click 'Issues'
Click 'New issue'
Type a title and description for your issue.
When you're finished, click Submit new issue.

## License

Copyright (c) 2018 Sam Kalum, See [LICENSE](https://github.com/skalum/subway-scheduler/LICENSE) for details.
