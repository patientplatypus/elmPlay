
<template>
  <div id="app">
    <Main :ports="setupPorts"></Main>
  </div>
</template>

<script>
import * as ElmComponent from './elm'
import "./styling/style.css"
export default {
  name: 'app',
  components: {
    'Main': ElmComponent(require('../Elm/Main.elm').Main)
  },
  methods: {
    setupPorts: function (ports) {
      ports.askJStime.subscribe(function (message) {
        console.log(message)
        var currentdate = new Date();
        var datetime = "Current Time: " + currentdate.getDate() + "/"
                        + (currentdate.getMonth()+1)  + "/"
                        + currentdate.getFullYear() + " @ "
                        + currentdate.getHours() + ":"
                        + currentdate.getMinutes() + ":"
                        + currentdate.getSeconds();
        ports.getJStime.send(datetime)
      })
      this.ports = ports
    }
  }
}
</script>
