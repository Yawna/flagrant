<script setup>
import HelloWorld from './components/HelloWorld.vue'

</script>

<template>
  <header>

    <div >
      <HelloWorld/>
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

h3 {
    font-size: 16px;
    font-size: 2.5vh;
}
.container-lp {
  width: 100%;
  max-width: 1280px;
  min-width: 320px;
  margin: 0 auto;
  clear: both;
}

.col-2-lp {
  float: left;
  width: 45%;
  margin-right: 5%;
}

.last-lp {
  margin-right: 0;
}

.col-2-lp img {
  width: 100%;
}
 /* Three image containers (use 25% for four, and 50% for two, etc) */
.column {
  float: left;
  width: 50%;
  padding: 1vw;
}

/* Clear floats after image containers */
.row::after {
  content: "";
  clear: both;
  display: table;
} 

.logo {
  display: block;
  margin: 0 auto 2rem;
}

a,
.green {
  text-decoration: none;
  color: hsla(160, 100%, 37%, 1);
  transition: 0.4s;
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
