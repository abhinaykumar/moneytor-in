import { Application } from "stimulus"

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)