<script setup>
</script>

<template>
  <header>
    <ul>
      <li><router-link to="/current-rankings">Current Rankings</router-link></li>
      <li><router-link to="/">Rank Flags</router-link></li>
    </ul> 
    <div >
      <router-view></router-view>
    </div>
  </header>


</template>

<style>
@import './assets/base.css';

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

 .active {
  background-color: #04AA6D;
}

#app {
  max-width: 5000px;
  margin: 0 auto;

  font-weight: normal;
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
}
</style>
