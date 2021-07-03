function initFlatpickr()
{
  // First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
  const startDateInput = document.getElementById('booking_date_start');
  const endDateInput = document.getElementById('booking_date_end');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#costume-booking-dates').dataset.unavailable)
  endDateInput.disabled = true

  const f = flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "d-m-Y",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      defaultDate: f.selectedDates[0],
      minDate: f.selectedDates[0],
      disable: unavailableDates,
      dateFormat: "d-m-Y"
      });
    })
  };
}

export { initFlatpickr };
