function initFlatpickr()
{
  // First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
  const startDateInput = document.getElementById('booking_date_start');
  const endDateInput = document.getElementById('booking_date_end');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#costume-booking-dates').dataset.unavailable)

    const f = flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "d-m-Y",
    });

    const e = flatpickr(endDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "d-m-Y"
    });

    endDateInput.disabled = (startDateInput.value == "")

    startDateInput.addEventListener("change", (event) => {
      if (startDateInput.value != "") {
        endDateInput.disabled = false
      }
      // set the end date default date if it is blank
      if (endDateInput.value == "" || e.selectedDates[0] < f.selectedDates[0])  e.setDate(f.selectedDates[0]);
      // set minimum calendar selection based on start date selection
      e.set("minDate", f.selectedDates[0]);
    })
  };
}

export { initFlatpickr };
