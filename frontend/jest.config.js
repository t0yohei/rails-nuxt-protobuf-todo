module.exports = {
  verbose: true,
  transform: {
    '.*\\.(vue)$': 'vue-jest',
    '^.+\\.js$': 'babel-jest',
    '^.+\\.tsx?$': 'ts-jest'
  },
  moduleFileExtensions: ['js', 'ts', 'json', 'vue'],
  testRegex: '(/__tests__/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$'
  // preset: 'jest-puppeteer'
}
