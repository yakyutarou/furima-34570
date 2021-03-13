const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {             //フォーム送信時イベント発火
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");     ///フォームの情報取得///
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_buy[number]"),
      exp_month: formData.get("order_buy[exp_month]"),
      exp_year: `20${formData.get("order_buy[exp_year]")}`,
      cvc: formData.get("order_buy[cvc]"),                         //フォームの情報取得//
    };
    Payjp.createToken(card, (status, response) => {                ///カード情報のトークン化///
      if (status == 200) {
        const token = response.id;                                  //カード情報のトークン化
        const renderDom = document.getElementById("charge-form");   ///トークンの情報をフォームに追加///
        const tokenObj = `<input value=${token} name='token' type="hidden">`;                  
        renderDom.insertAdjacentHTML("beforeend", tokenObj);        //トークンの情報をフォームに追加//
      }
        document.getElementById("card-number").removeAttribute("name");     ///カード情報の削除///
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");    //カード情報の削除//
        
        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);