const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  const page = await browser.newPage();
  await page.goto('https://www.aeoneshop.com', { waitUntil: 'networkidle2' });

  const html = await page.content();
  console.log(html);

  await browser.close();
})();
