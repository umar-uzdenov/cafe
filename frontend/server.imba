import index from './index.html'
import express from 'express'
import dotenv from 'dotenv'
import TelegramBot from 'node-telegram-bot-api'

dotenv.config()
const TOKEN = process.env.TOKEN;
const ADMIN_ID = parseInt(process.env.ADMIN_ID, 10);

const bot = new TelegramBot(TOKEN, { polling: true })
def test
	bot.sendMessage(ADMIN_ID, "Hello admin")
# test!

const app = express!
app.use express.json!

# const sub = express()
# sub.use express.json!

# app.use "/cafe", sub

# @ts-ignore
app.get '/', do(req, res)
	res.send index.body

# @ts-ignore
app.post '/order', do(req, res)
	console.log(req.body)
	res.json {success:"success"}
	let items = req.body.items
		.map(do "{$1.name}: {$1.price} ₽ x {$1.quantity} = {$1.price * $1.quantity} ₽")
		.join("\n")
	let total = "Итого: {req.body.total} ₽"
	let tel = "Телефон: {req.body.tel}"
	let address = req.body.address == "" ? "" : "Адрес доставки: {req.body.address}"
	bot.sendMessage ADMIN_ID, "{items}\n---\n{total}\n\n{tel}\n{address}"


# @ts-ignore
imba.serve app.listen(5500, '0.0.0.0')
# imba.serve app.listen(process.env.PORT or 5000, '0.0.0.0')
