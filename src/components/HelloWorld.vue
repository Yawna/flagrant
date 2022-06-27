<script setup>
import DelawareIcon from './icons/Flag_of_Delaware.svg'
import PennIcon from './icons/Flag_of_Pennsylvania.svg'

function changeFlag() {
    document.getElementById("Flag1").src = PennIcon;
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
 <!-- <div class="row">
  <div class="column">
    <img v-bind:src="DelawareIcon" style="width:100%">
  </div>
  <div class="column">
    <img v-bind:src="PennIcon"  style="width:100%">
  </div>
</div>  -->


<div class="container-lp">
    <div class="col-2-lp">
        <img v-bind:src="DelawareIcon" id="Flag1" onclick="changeFlag()">
    </div>
    <div class="col-2-lp last-lp">
        <img v-bind:src="PennIcon" id="Flag2" onclick="changeFlag()">
    </div>
</div>


</template>
