const pals = document.querySelector("#pals");
const bookings = document.querySelector("#bookings");
const items = [ pals, bookings ];

const pals_list = document.querySelector("#pals-list");
const bookings_list = document.querySelector("#bookings-list");

items.addEventListener("click", (event) => {
  event.preventDefault();
  if (event.currentTarget() == bookings) {
    pals_list.classList.remove("active");
    pals_list.classList.add("hidden");
    bookings_list.classList.remove("hidden");
    bookings_list.classList.add("active");
  }
  else if (event.currentTarget() == pals) {
    bookings_list.classList.remove("active");
    bookings_list.classList.add("hidden");
    pals_list.classList.remove("hidden");
    pals_list.classList.add("active");
  };

  // Do something (callback)
});
