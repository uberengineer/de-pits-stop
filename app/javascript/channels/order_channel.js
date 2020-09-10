import consumer from "./consumer";

const initOrdersCable = () => {
  const orderContainer = document.getElementById('orders');
  if (orderContainer) {
    consumer.subscriptions.create({ channel: "OrderChannel"}, {
      connected(){
        console.log(this)
      },
      received(data) {
        console.log("SSSSS");
        console.log(data);
        orderContainer.insertAdjacentHTML('afterend', data);
      }
    });
  }
}

export { initOrdersCable };
