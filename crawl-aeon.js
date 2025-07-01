const puppeteer = require('puppeteer-extra')
const StealthPlugin = require('puppeteer-extra-plugin-stealth')

puppeteer.use(StealthPlugin())

;(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  })

  const page = await browser.newPage()
  await page.goto('https://www.aeonshop.com', { waitUntil: 'domcontentloaded' })

  console.log('✅ Truy cập aeonshop thành công')
  await browser.close()
})()
