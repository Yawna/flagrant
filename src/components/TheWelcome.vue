<script setup>
import DelawareIcon from './icons/Flag_of_Delaware.svg'
import PennIcon from './icons/Flag_of_Pennsylvania.svg'

</script>

<style>
@import '../assets/base.css';

img {
width:100%;
height:auto;
}

.logo {
position:absolute;
right:100%;
top:0px;
width:100%;
height:auto;
}
</style>

<template>
  <div>

    <img  v-bind:src="DelawareIcon" class = "logo"/>

  </div>
</template>

