# Maps

Demonstrate reactive map navigation, making use of Stimulus Reflex, Cable Ready, Stimulus and Leaflet/Mapbox. The 💡 idea here is that we use the Cable Ready`set_dataset_property` operation to trigger `valueChanged` callbacks in the Stimulus controller. We do have to take special care to make sure the callbacks do not fire too often.

A good potential next step would be to debounce the Reflex calls, as scroll wheel zooming tends to get a little <i>busy</i>.

You will require a Mapbox key to be set up in your environment or your Rails credentials:

[Get a key](https://www.mapbox.com/studio/account/tokens/)

## Demo

There is an instance running on Heroku: [https://stimulus-reflex-maps.herokuapp.com/](https://stimulus-reflex-maps.herokuapp.com/)

## Installation

- ensure Postgres and Redis are both running and available on the usual ports
- `bundle`
- `yarn`
- `bin/setup`
- install `MAPBOX_TOKEN` environment variable or `mapbox_token` credential
- run `bin/webpack-dev-server` in a terminal window
- run `rails s` in another terminal window
