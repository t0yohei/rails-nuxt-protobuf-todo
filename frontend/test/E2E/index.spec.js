let page

beforeAll(async () => {
  // eslint-disable-next-line no-undef
  page = await browser.newPage()
  await page.goto('https://google.com')
})

test('should display `google` text on page', async () => {
  await expect(page).toMatch('google')
})
