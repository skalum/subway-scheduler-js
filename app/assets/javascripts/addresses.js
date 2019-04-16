class Address {
  constructor(address) {
    this.id = address.id;
    this.line_1 = address.line_1;
    this.line_2 = address.line_2;
    this.city = address.city;
    this.zip = address.zip;

    this.path = `/addresses/${this.id}`;

    this.string = this.stringify();
  }

  static getAll(url) {
    allAddresses = [];

    $.get(`${url}.json`, function(response) {
      response.forEach(function(response_item) {
        var address = new Address(response_item);
        allAddresses.push(address);
      });
    }).then(() =>
      $("#address-list").html(HandlebarsTemplates['all-addresses']({items: allAddresses}))
    );

    return
  }

  stringify() {
    var addressAsString = "";

    addressAsString += `${this.line_1}, `;
    addressAsString += ((this.line_2) ? `${this.line_2}, ` : '' );
    addressAsString += `${this.city}, NY ${this.zip}`;

    return addressAsString
  }
}

var allAddresses = [];

$(document).ready(function() {

  Address.getAll("/addresses")

  $("#new_address").submit(function(e) {
    e.preventDefault();

    var values = $(this).serialize();
    var posting = $.post('/addresses', values)

    posting.done(function(data) {
      addr = new Address(data);
      Address.getAll('/addresses');
    })

    this.reset();
  });
});
