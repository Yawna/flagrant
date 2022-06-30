<script>

function changeFlag() {
    this.text = "foobar";
}

export default {
  data() {
    return {
      text: ''
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
        <img src="@/assets/Flag_of_Delaware.svg" id="Flag1" :onclick="changeFlag">
    </div>
    <div class="col-2-lp last-lp">
        <img src="@/assets/Flag_of_Pennsylvania.svg" id="Flag2" :onclick="changeFlag">
    </div>
</div>


</template>
