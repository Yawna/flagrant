<script setup>
//import HelloWorld from './components/HelloWorld.vue'
import OverAllRankings from './components/OverAllRankings.vue'
</script>

<template>
  <header>

    <div >
      <OverAllRankings/>
    </div>
  </header>


</template>

<style>
@import './assets/base.css';

#app {
  max-width: 5000px;
  margin: 0 auto;
  padding: 1vw;

  font-weight: normal;
}

header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media only screen and (min-device-width: 320px) and (max-device-width: 600px) {
  .col-2-lp {
    width: 100%;
    float: none;
    margin: auto;
  }
  .last-lp {
    margin-right: auto;
  }
}

div.mainText {
  padding-left: 10px;
  padding-top: 20px;
  padding-bottom: 5px;
}

@media screen and (min-width: 601px) {
  div.mainText{
    font-size: 30px;
  }
}

@media screen and (max-width: 600px) {
  div.mainText {
    font-size: 15px;
  }
}

@media screen and (min-width: 601px) {
  div.mainText2{
    font-size: 25px;
  }
}

@media screen and (max-width: 600px) {
  div.mainText2 {
    font-size: 15px;
  }
}

@media screen and (min-width: 601px) {
  .container {
    display: flex;
    flex-flow: column wrap;
    justify-content: space-around;
    align-items: center;
    padding: 0;
    margin: 0;
    height: 80vh;
  }
}

@media screen and (min-width: 601px) {
  .container2 {
    flex-direction: row;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 350px;
    width: 100%;
    margin-bottom: 5vh;
  }
}

@media screen and (max-width: 600px) {
  .container2{
    display: flex;
    flex-flow: column wrap;
    justify-content: space-around;
    padding: 0 ;
    margin-bottom: 15px;
    width:100%;
    align-items: center;
  }
}


@media screen and (max-width: 600px) {
  .container{
    display: flex;
    flex-flow: column wrap;
    justify-content: space-around;
    padding: 0 ;
    margin: 0;
    align-items: center;
  }
}


@media screen and (min-width: 601px) {
.item {
  width: 40%;
 }
}
@media screen and (min-width: 601px) {
.item2 {
  height: 350px;
  display: flex;
 }
}
@media screen and (min-width: 601px) {
.item2b {
  margin-right: 7%;
  display: flex;
 }
}

@media screen and (max-width: 600px) {
.item2 {
  height: 150px;
  display: flex;
 }
}
@media screen and (max-width: 600px) {
.item2b {
  margin-right: 7%;
  display: flex;
  padding: 12px;
 }
}


@media screen and (max-width: 600px) {
.item {
  height:40%;
  width: 80%;
 }
}


@media (hover: hover) {
  a:hover {
    background-color: hsla(160, 100%, 37%, 0.2);
  }
}

@media (min-width: 5000px) {
  body {
    display: flex;
    place-items: center;
  }

  #app {
    display: grid;
    grid-template-columns: 1fr 1fr;
    padding: 0 2rem;
  }

  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  .logo {
    margin: 0 2rem 0 0;
  }
}
</style>
