

// const selectCurrency = (baseCurrency, rates) => ({
//   type: "SWITCH_CURRENCY",
//   baseCurrency,
//   rates
// });

function selectCurrency(baseCurrency, rates) {
  return {
    type: "SWITCH_CURRENCY",
    baseCurrency,
    rates
  };
}

export default selectCurrency;
