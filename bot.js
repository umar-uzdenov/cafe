require('dotenv').config();
const TelegramBot = require('node-telegram-bot-api');
const bodyParser = require('body-parser');
const path = require('path');

const TOKEN = process.env.TOKEN;
const ADMIN_ID = parseInt(process.env.ADMIN_ID, 10);

const bot = new TelegramBot(TOKEN, { polling: true });

// Menu categories and items (all halal, no forbidden items)
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

// Store orders in memory (for demo purposes)
let orders = {};
let orderIdCounter = 1;

// Telegram bot commands and handlers
bot.onText(/\/start/, (msg) => {
  const chatId = msg.chat.id;
  bot.sendMessage(chatId, "Welcome to the Cafe Bot! Please use the menu to place your order.", {
    reply_markup: {
      keyboard: [
        [{ text: "Order via Web App" }],
        [{ text: "Check Order Status" }]
      ],
      resize_keyboard: true,
      one_time_keyboard: true
    }
  });
});

// Handle text messages and web app data
bot.on('message', (msg) => {
    console.log(msg)
  const chatId = msg.chat.id;

  // Handle data sent from Telegram Web App
  if (msg.web_app_data) {
    console.log(msg.web_app_data);

    try {
      const data = JSON.parse(msg.web_app_data.data);
      if (data.chatId && data.items && Array.isArray(data.items) && data.items.length > 0) {
        const orderId = orderIdCounter++;
        orders[orderId] = {
          id: orderId,
          chatId: data.chatId,
          items: data.items,
          status: "Pending"
        };
        const orderDetails = data.items.map(i => `${i.name} x${i.quantity}`).join(", ");
        bot.sendMessage(ADMIN_ID, `New order #${orderId} from user ${data.chatId}:\n${orderDetails}\n\nReply with /confirm ${orderId} to mark as completed.`);
        bot.sendMessage(data.chatId, `Your order #${orderId} has been received. Thank you!`);
      }
    } catch (e) {
      console.error('Failed to parse web_app_data:', e);
    }
    return;
  }

  const text = msg.text;

  if (text === "Order via Web App") {
    // Send web app link
    const webAppUrl = `http://localhost:${PORT}/index.html?chatId=${chatId}`;
    bot.sendMessage(chatId, "Please place your order using the web app:", {
      reply_markup: {
        inline_keyboard: [
          [{ text: "Open Web App", web_app: { url: webAppUrl } }]
        ]
      }
    });
  } else if (text === "Check Order Status") {
    // Show user's orders and their status
    const userOrders = Object.values(orders).filter(o => o.chatId === chatId);
    if (userOrders.length === 0) {
      bot.sendMessage(chatId, "You have no orders.");
    } else {
      let statusMsg = "Your orders:\n";
      userOrders.forEach(o => {
        statusMsg += `Order #${o.id}: ${o.status}\n`;
      });
      bot.sendMessage(chatId, statusMsg);
    }
  }
});

// Admin command to confirm order completion
bot.onText(/\/confirm (\d+)/, (msg, match) => {
  const chatId = msg.chat.id;
  if (chatId !== ADMIN_ID) {
    bot.sendMessage(chatId, "You are not authorized to confirm orders.");
    return;
  }
  const orderId = parseInt(match[1]);
  if (!orders[orderId]) {
    bot.sendMessage(chatId, `Order #${orderId} not found.`);
    return;
  }
  orders[orderId].status = "Completed";
  bot.sendMessage(chatId, `Order #${orderId} marked as completed.`);
  bot.sendMessage(orders[orderId].chatId, `Your order #${orderId} has been completed. Thank you!`);
});


