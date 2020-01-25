module.exports = {
  launch: {
    headless: true,
    slowMo: 250
  },
  server: {
    command: 'yarn run testServer',
    port: 3000,
    launchTimeout: 50000
  }
}
