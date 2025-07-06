import index from './index.html'
import express from 'express'
import dotenv from 'dotenv'
import TelegramBot from 'node-telegram-bot-api'
import fs from 'fs'
import https from "https"

dotenv.config()

const TOKEN = process.env.TOKEN;
const ADMIN_ID = +process.env.ADMIN_ID
const PORT = +process.env.PORT || 443
const IP = +process.env.IP || "0.0.0.0"
# console.log(process.env)

const bot = new TelegramBot(TOKEN, { polling: true })


const app = express!
app.use express.json!


# @ts-ignore
app.get '/', do $2.send index.body # for main

# @ts-ignore
# app.get '/cafe-vasabi', do $2.send index.body

const cafeVasabi = express()
app.use '/cafe-vasabi', cafeVasabi
# @ts-ignore
cafeVasabi.get '/', do $2.send index.body



# @ts-ignore
cafeVasabi.post '/order', do(req, res)
	console.log(req.body)
	let items = req.body.items
		.map(do "{$1.name}: {$1.price} ₽ x {$1.quantity} = {$1.price * $1.quantity} ₽")
		.join("\n")
	let total = "Итого: {req.body.total} ₽"
	let tel = "Телефон: {req.body.tel}"
	let address = req.body.address == "" ? "" : "Адрес доставки: {req.body.address}"
	bot.sendMessage ADMIN_ID, "{items}\n---\n{total}\n\n{tel}\n{address}"

	res.json {success:"success"}

# let privateKey = fs.readFileSync 'privatekey.pem'
# var certificate = fs.readFileSync 'certificate.pem'

# https.createServer({
#     key: privateKey,
#     cert: certificate
# }, app).listen(port);

# console.log imba.serve


if +process.env.SERVER
	const options =
		key: fs.readFileSync '../../etc/letsencrypt/live/krch-cafe-bot.ru/privkey.pem'
		cert: fs.readFileSync '../../etc/letsencrypt/live/krch-cafe-bot.ru/fullchain.pem'
	# @ts-ignore
	imba.serve https
		.createServer(options, app)
		.listen(443) do console.log "lol"
else
	# @ts-ignore
	imba.serve app.listen(IP), {}, {}

	# @ts-ignore
	# imba.serve app.listen(PORT, IP) 


console.log typeof +process.env.SERVER

# imba.serve app.listen(process.env.PORT or 5000, '0.0.0.0')
