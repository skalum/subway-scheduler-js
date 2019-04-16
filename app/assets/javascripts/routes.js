class Route {
  constructor(route) {
    this.id = route.id;
    this.name = route.name;
    this.origin = new Address(route.origin);
    this.destination = new Address(route.destination);
    this.user = route.user;

    this.path = `/routes/${this.id}`;

    this.directions = [];
  }

  static getAll(url) {
    allRoutes = [];

    $.get(`${url}.json`, function(response) {
      response.forEach(function(response_item) {
        var route = new Route(response_item);
        allRoutes.push(route);
      });
    }).then(() =>
      $("#routes-list").html(HandlebarsTemplates['all-routes']({items: allRoutes}))
    );

    return
  }

  showRoute(el) {
    const route = this;

    var request = {
      origin: route.origin.string,
      destination: route.destination.string,
      travelMode: 'TRANSIT'
    };

    directionsService.route(request, function(result, status) {
      if (status == 'OK') {
        console.log(route);
        route.directions = result['routes'][0]['legs'][0]['steps']
        el.after(HandlebarsTemplates['show-route'](route));
      }
    });
  }
}

var directionsService = new google.maps.DirectionsService();

var allRoutes = [];

$(document).ready(function() {
  var url = "/routes"

  if ($('#routes-list').data('user-id')) {
    url = `/users/${$('#routes-list').data('user-id')}/routes`;
  }

  Route.getAll(url)
});

$(document).on('click', '.show_route', function(e) {
  e.preventDefault();
  const element = $(this)

  const route = allRoutes.find(function(rte) {
    return rte.id == element.data('route-id')
  }).showRoute(element)
});

$(document).on('submit', '#new_route', function(e) {
  e.preventDefault();

  var values = $(this).serialize();
  var posting = $.post('/routes', values)

  posting.done(function(data) {
    rte = new Route(data);
    Route.getAll('/routes');
  })

  this.reset();
});
