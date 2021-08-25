import Vue from 'vue'
import VueRouter from 'vue-router'
import {mapState} from 'vuex'
import Home from '../views/Home.vue'
import Designer from '../views/Designer.vue'
import Icyicon from '../views/Icyicon.vue'
import Toplist from '../views/Toplist.vue'
import Search from '../views/Search.vue'
import Register from '../views/Register.vue'
import Login from '../views/Login.vue'
import Me from '../views/Me.vue'
import Address from '../views/Address.vue'
import MyAddress from '../views/MyAddress.vue'
import MySet from '../views/MySet.vue'
import My from '../views/My.vue'
import MyLike from '../views/MyLike.vue'
import MyCar from '../views/MyCar.vue'

const originalPush = VueRouter.prototype.push

VueRouter.prototype.push = function push (location) {

 return originalPush.call(this, location).catch(err => err)

}

Vue.use(VueRouter)

const routes = [
  {
    path: '/myLike/:uid',
    component: MyLike,
    props:true,
  },
  {
    path: '/myCar/:uid',
    component: MyCar,
    props:true,
  },
  {
    path: '/my/:uid',
    component: () => import(
      /* webpackChunkName: "my" */ 
      '../views/My.vue'),
    props:true,
  },
  {
    path: '/mySet/:uid',
    component: MySet,
    props:true,
  },
  {
    path: '/myAddress/:uid',
    component: MyAddress,
    props:true,
  },
  {
    path: '/address/:uid',
    component: Address,
    props:true,
  },
  {
    path: '/me/:uid',
    component: Me,
    props:true,
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/register',
    component: Register
  },
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta:{
      keepalive:false
  }
  },
  {
    path: '/designer/:did',
    name: 'Designer',
    component: Designer,
    props:true
  },
  {
    path: '/icyicon',
    name: 'Icyicon',
    component: Icyicon
  },
  {
    path: '/toplist',
    name: 'Toplist',
    component: Toplist
  },
  {
    path: '/search',
    name: 'Search',
    component: Search
  },

  {
    path:"/community", 
    component: ()=>import(
     /* webpackChunkName: "community" */
   "../views/Community.vue"
    )
  },
  
  {
    path:"/order", 
    component: ()=>import(
     /* webpackChunkName: "order" */
   "../views/Order.vue"
    )
  },
  {
    path:"/detail/:lid", 
    props:true,
    component: ()=>import(
     /* webpackChunkName: "detail" */
   "../views/Detail.vue"
    )
  },
  {
    path:"/product", 
    component: ()=>import(
     /* webpackChunkName: "product" */
   "../views/Product.vue"
    ),
    meta:{
      keepalive:false
  }
  },

]

const router = new VueRouter({
  routes
})

export default router
