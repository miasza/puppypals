const pals = document.querySelector("#pals");
const bookings = document.querySelector("#bookings");
const items = [ pals, bookings ];

const pals_list = document.querySelector("#pals-list");
const bookings_list = document.querySelector("#bookings-list");

items.forEach((item) => {
  if (item !== null) {
    item.addEventListener("click", (event) => {
      event.preventDefault();
      if (item === bookings) {
        pals_list.classList.remove("active");
        pals_list.classList.add("hidden");
        bookings_list.classList.remove("hidden");
        bookings_list.classList.add("active");
      };
      if (item === pals) {
        bookings_list.classList.remove("active");
        bookings_list.classList.add("hidden");
        pals_list.classList.remove("hidden");
        pals_list.classList.add("active");
      };
    });
  }
  // Do something (callback)
});
