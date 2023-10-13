var showBookings = document.getElementById("showBookings");
var showTables = document.getElementById("showTables");
var showCustomers = document.getElementById("showCustomers");
var dataTable = document.getElementById("dataTable");

$(document).ready(() => {
  showBookings.addEventListener("click", () => {
    fetchDataFromServer("showBookings");
  });

  showTables.addEventListener("click", () => {
    fetchDataFromServer("showTables");
  });

  showCustomers.addEventListener("click", () => {
    fetchDataFromServer("showCustomers");
  });

  function fetchDataFromServer(action) {
    $.ajax({
      url: "../Controllers/backend.php",
      type: "POST",
      data: { action: action },
      dataType: "html",
      success: (response) => {
        console.log(response);
        $(dataTable).html(response);
      },
    });
  }
});
