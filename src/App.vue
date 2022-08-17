<script setup>
</script>

<template>
  <header>
    <ul>
      <li><router-link to="/">Vote</router-link></li>
      <li><router-link to="/current-rankings">Rankings</router-link></li>
      <li><router-link to="about">Why?</router-link></li>
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
  }

li {
  float: left;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  font-size: 15pt;
  text-decoration: none;
}

 li a:hover {
  background-color: rgb(218, 238, 245);
}

#app {
  max-width: 5000px;
  margin: 0 auto;

  font-weight: normal;
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
