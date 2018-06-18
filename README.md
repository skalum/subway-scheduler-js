# Subway Scheduler

Subway Scheduler saves your commonly used addresses and fetches directions between them from the Google Maps API.

## Usage

To use this app, just clone, run `bundle install`, `rake db:migrate`, `rake db:seed` and then run `rails s`.

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

## Contribution

Bug reports and pull requests are welcome on GitHub at https://github.com/skalum/subway-scheduler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.

## License

[subway-scheduler](https://github.com/skalum/subway-scheduler/blob/master/LICENSE) is licensed under the [MIT license](http://opensource.org/licenses/MIT).

## More Info
