import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { Autocomplete } from "stimulus-autocomplete"

const application = Application.start()
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'
require("flatpickr/dist/flatpickr.css")

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)


// Autocomplete Stimulus
application.register('autocomplete', Autocomplete)