const pals = document.querySelector("#pals");
const bookings = document.querySelector("#bookings");
const items = [ pals, bookings ];

const pals_list = document.querySelector("#pals-list");
const bookings_list = document.querySelector("#bookings-list");

const tab_1 = document.querySelector("#tab-1");
const tab_2 = document.querySelector("#tab-2");
const tabs = [ tab_1, tab_2 ];

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


tabs.forEach((item) => {
  if (item !== null) {
    item.addEventListener("click", (event) => {
      event.preventDefault();
      if (item === tab_1) {
        tab_2.classList.remove("tab-active");
        tab_2.classList.add("inactive");
        tab_1.classList.remove("inactive");
        tab_1.classList.add("tab-active");

      };
      if (item === tab_2) {
        tab_1.classList.remove("tab-active");
        tab_1.classList.add("inactive");
        tab_2.classList.remove("inactive");
        tab_2.classList.add("tab-active");
      };
    });
  }
  // Do something (callback)
});


