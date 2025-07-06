window.Telegram.WebApp.ready()

if ["ios", "android"].includes(window.Telegram.WebApp.platform.toLowerCase())
	window.Telegram.WebApp.requestFullscreen()

# defining globals
extend tag element
	get tg do window.Telegram.WebApp
	def sleep ms do new Promise(do setTimeout($1, ms))
	def launch do setTimeout $1, 0






# function launchLoop(fun, interval = 1000, immediate = true) {
#     if (immediate) { setTimeout(fun, 0) }
#     setInterval(fun, interval)
# }

# const tg = window.Telegram.WebApp
# if (parseFloat(tg.version) > 6) tg.disableVerticalSwipes()
# if (["ios", "android"].includes(tg.platform.toLowerCase())) tg.requestFullscreen()


# function minuteSpell(minutes) {
#     // return right spelling for russian word "минута" according to given minutes
#     const lastDigit = minutes % 10;
#     const lastTwoDigits = minutes % 100;
#     // console.log({lastDigit, lastTwoDigits})

#     if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
#         return 'минут';
#     }

#     if (lastDigit === 1) {
#         return 'минута';
#     }

#     if (lastDigit >= 2 && lastDigit <= 4) {
#         return 'минуты';
#     }

#     return 'минут';
# }

# Array.prototype.random = function() {
#     return this[Math.floor(Math.random() * this.length)];
# }

# function get(url, params) {
#     return new Promise((resolve, reject) => {
#         try {
#             const xhr = new XMLHttpRequest();
#             xhr.open('GET', `${url}?${new URLSearchParams(params).toString()}`)
#             xhr.onload = () => {
#                 if (xhr.status >= 200 && xhr.status < 300) {
#                     resolve(JSON.parse(xhr.responseText))
#                 } else {
#                     reject(`Request failed with status ${xhr.status}`)
#                 }
#             };
#             xhr.onerror = () => {
#                 reject('Network error')
#             };
#             xhr.send()
#         } catch (error) {
#             reject(`Error: ${error}`)
#         }
#     })   
# }