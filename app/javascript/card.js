const pay = () => {
  Payjp.setPublicKey("pk_test_ce0041637657e6c307274600");
  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById('charge-form');
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_detail[number]"),
      cvc: formData.get("purchase_detail[cvc]"),
      exp_month: formData.get("purchase_detail[exp_month]"),
      exp_year: `20${formData.get("purchase_detail[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);