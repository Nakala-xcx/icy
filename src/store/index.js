import Vue from 'vue'
import Vuex from 'vuex'
import axios from "axios"
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uid:0
  },
  mutations: {
    setUid(state,uid){
      state.uid=uid;
    }
  },
  actions: {
    vLogin(context,from){
      return new Promise(
        function(resolve,reject){
          if(localStorage.getItem('uid')){
            context.commit(
              "setUid",localStorage.getItem('uid')
            );
          }else{
          axios.post(
            "/user/login",
            `uname=${from.uname}&upwd=${from.upwd}&code=${from.capcode}`
          ).then(result=>{
            if(result.data.code == 200){
              localStorage.setItem('uid',result.data.data.uid)
              context.commit(
                "setUid",result.data.data.uid
              );
              resolve();
            }else{

              reject(result.data.msg);
            }
          })
        }
        }
      )
    }
  },
  modules: {
  }
})
