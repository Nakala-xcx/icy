import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from "axios"
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import Viewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'
import VueTouch from 'vue-touch'

import Myend from './components/Myend.vue'
import MayLike from './components/mayLike.vue'
import Bottom from './components/Bottom.vue'
import Blank from './components/blank.vue'

Vue.component('myend',Myend);
Vue.component('maylike',MayLike);
Vue.component('bottom',Bottom);
Vue.component('blank',Blank);


Vue.use(VueTouch, {name: 'v-touch'})
Vue.use(MintUI)
Vue.use(Viewer, {
  defaultOptions: {
  zIndex:1,
  inline:false,
  button:true,
  navbar:false,
  title:false,
  toolbar:false,
  tooltip:true,
  movable:true,
  zoomable:true,
  rotatable:false,
  scalable:false,
  transition:true,
  fullscreen:true,
  keyboard:false,
  loop:false,
  }
  })

Vue.prototype.axios=axios;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
