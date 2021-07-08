// This function calculates the total price of the booking
function totalPrice()
{
  // First we define variables that are going to grab our inputs field and display the total price
  const startDateInput = document.getElementById('booking_date_start');
  const endDateInput = document.getElementById('booking_date_end');
  const finalPrice = document.getElementById('final_price');
  // Grab the selected dates
  const formatted_date1 = startDateInput.value.split("-")
  const formatted_date2 = endDateInput.value.split("-")
  // since default JS Date format is YYYY-MM-DD and flatpickr's is DD-MM-YYYY, we need to reformat the dates
  const date1 = new Date(formatted_date1[2], Number(formatted_date1[1]) - 1, formatted_date1[0]);
  const date2 = new Date(formatted_date2[2], Number(formatted_date2[1]) - 1, formatted_date2[0]);

  // To calculate the time difference of two dates
  const DifferenceInTime = date2.getTime() - date1.getTime();

  // To calculate the no. of days between two dates
  const DifferenceInDays = DifferenceInTime / (1000 * 3600 * 24);

  //calculate the total price
  let totalPrice = Number(finalPrice.dataset.rate);
  if (DifferenceInDays > 1) {
    totalPrice = DifferenceInDays * Number(finalPrice.dataset.rate);
  }
  // display the total price
  finalPrice.innerText = `$${totalPrice} total`;
}

export { totalPrice };
