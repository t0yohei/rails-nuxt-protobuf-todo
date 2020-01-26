import { mount } from '@vue/test-utils'
import NewTaskForm from '../NewTaskForm.vue'

describe('NewTaskForm.vue', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(NewTaskForm)
    expect(wrapper.isVueInstance()).toBeTruthy()
  })
})
