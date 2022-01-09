import 'stylesheets/application.scss'
import Rails from 'mrujs'
import * as Turbo from '@hotwired/turbo'

window.Turbo = Turbo

import 'controllers'
import 'channels'

const images = require.context('../images', true)
// const imagePath = name => images(name, true)

Rails.start()
