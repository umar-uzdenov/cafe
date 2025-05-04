// const urlParams = new URLSearchParams(window.location.search);
// const chatId = urlParams.get('chatId');

const tg = window.Telegram.WebApp
tg.ready()

const categories = {
  "hot_dishes": "Hot Dishes",
  "cold_dishes": "Cold Dishes",
  "desserts": "Desserts",
  "hot_drinks": "Hot Drinks",
  "cold_drinks": "Cold Drinks"
};

const menu = {
  "hot_dishes": [
    { id: 1, name: "Grilled Chicken", price: 10 },
    { id: 2, name: "Beef Stew", price: 12 }
  ],
  "cold_dishes": [
    { id: 3, name: "Caesar Salad", price: 8 },
    { id: 4, name: "Cold Noodle Salad", price: 7 }
  ],
  "desserts": [
    { id: 5, name: "Baklava", price: 5 },
    { id: 6, name: "Fruit Salad", price: 4 }
  ],
  "hot_drinks": [
    { id: 7, name: "Turkish Coffee", price: 3 },
    { id: 8, name: "Green Tea", price: 2 }
  ],
  "cold_drinks": [
    { id: 9, name: "Mint Lemonade", price: 3 },
    { id: 10, name: "Iced Tea", price: 2 }
  ]
};

let currentCategory = 'hot_dishes';
let order = [];

const categoriesDiv = document.getElementById('categories');
const itemsDiv = document.getElementById('items');
const orderList = document.getElementById('order-list');
const submitOrderBtn = document.getElementById('submit-order');

function renderCategories() {
  categoriesDiv.innerHTML = '';
  Object.entries(categories).forEach(([key, label]) => {
    const btn = document.createElement('button');
    btn.textContent = label;
    btn.onclick = () => {
      currentCategory = key;
      renderItems();
    };
    categoriesDiv.appendChild(btn);
  });
}

function renderItems() {
  itemsDiv.innerHTML = '';
  if (!currentCategory) return;
  menu[currentCategory].forEach(item => {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'menu-item';
    itemDiv.textContent = `${item.name} - $${item.price}`;
    const addBtn = document.createElement('button');
    addBtn.textContent = 'Add';
    addBtn.onclick = () => {
      addToOrder(item);
    };
    itemDiv.appendChild(addBtn);
    itemsDiv.appendChild(itemDiv);
  });
}

function addToOrder(item) {
  const existing = order.find(i => i.id === item.id);
  if (existing) {
    existing.quantity++;
  } else {
    order.push({ ...item, quantity: 1 });
  }
  renderOrder();
}

function renderOrder() {
  orderList.innerHTML = '';
  order.forEach(item => {
    const li = document.createElement('li');
    li.textContent = `${item.name} x${item.quantity}`;
    orderList.appendChild(li);
  });
}

submitOrderBtn.onclick = () => {
  if (order.length === 0) {
    alert('Please add items to your order.');
    return;
  }
  if (window.Telegram && tg) {
    const dataToSend = {
      chatId: tg.initDataUnsafe.user.id,
      items: order
    };
    tg.sendData(JSON.stringify(dataToSend));
    alert('Order submitted! Please wait for confirmation.');
    order = [];
    renderOrder();
  } else {
    alert('Telegram Web App API is not available.');
  }
};

renderCategories();
