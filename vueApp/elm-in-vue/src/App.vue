
<template>
  <div id="app">
    <Main></Main>
  </div>
</template>

<script>
import * as ElmComponent from './elm'
import "./styling/style.css"
export default {
  name: 'app',
  components: {
    'Main': ElmComponent(require('../Elm/Main.elm').Main)
  }
}
</script>
