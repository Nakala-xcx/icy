<template>
    <div></div>
</template>
<script >
import { mapActions, mapMutations} from "vuex";
export default {
    mounted(){
       this.vLogin()
    },
    methods:{
            ...mapActions(["vLogin"]),
    ...mapMutations(['setUid']),
    }
}
</script>