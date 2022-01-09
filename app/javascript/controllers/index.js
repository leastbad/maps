import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from './application_controller'
import CableReady from 'cable_ready'

const application = Application.start()
application.load(
  definitionsFromContext(
    require.context('controllers', true, /_controller\.js$/)
  )
)
application.consumer = consumer

StimulusReflex.initialize(application, {
  controller,
  isolate: true
})

if (process.env.RAILS_ENV === 'development') {
  StimulusReflex.debug = true
}

CableReady.initialize({ consumer })
