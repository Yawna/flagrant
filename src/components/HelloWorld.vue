<script>

function changeFlag() {
    this.Flag1 = 'Georgia';
}

export default {
  data() {
    return {
      Flag1: 'Delaware',
      Flag2:'Pennsylvania'
    }
  },
  name: 'HelloWorld',
  methods: {
      changeFlag
      
  }
}

</script>
<style>
@import '../assets/base.css';



</style>

<template>
<p></p>
 <h3>
    Select your preferred flag.
 </h3>
 <p></p>


<div class="container-lp">
    <div class="col-2-lp">
        <img :src="`/assets/flags/Flag_of_${Flag1}.svg`" id="Flag1" :onclick="changeFlag">
    </div>
    <div class="col-2-lp last-lp">
        <img :src="`/assets/flags/Flag_of_${Flag2}.svg`" id="Flag2" :onclick="changeFlag">
    </div>
</div>


</template>
