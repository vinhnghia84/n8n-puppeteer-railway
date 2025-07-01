const puppeteer = require('puppeteer-extra')
const StealthPlugin = require('puppeteer-extra-plugin-stealth')

puppeteer.use(StealthPlugin())

;(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  })

  const page = await browser.newPage()

  // Giả làm Chrome thật để vượt qua anti-bot
  await page.setUserAgent(
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
  )

  // Tăng timeout lên 60 giây
  await page.goto('https://www.aeonshop.com', {
    waitUntil: 'networkidle2',
    timeout: 60000
  })

  console.log('✅ Truy cập aeonshop thành công')
  await browser.close()
})()
