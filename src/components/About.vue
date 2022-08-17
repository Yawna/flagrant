<style scoped>



@media screen and (min-width: 601px) {
  div.mainText{
    font-size: 30px;
    padding-left: 150px;
    padding-top: 20px;
    padding-bottom: 5px;
  }
}

@media screen and (max-width: 600px) {
  div.mainText {
    font-size: 20px;
    padding-left: 25px;
    padding-top: 20px;
    padding-bottom: 5px;
  }
}

@media screen and (min-width: 601px) {
    p {
        padding-left: 150px;
        font-size: 20px;
    }
}
@media screen and (max-width: 600px) {
    p {
        padding-left: 25px;
        font-size: 15px;
    }
}

@media screen and (min-width: 601px) {
  div.container {
    display: flex;
    flex-flow: row wrap;
    justify-content: flex-start;
    align-items: flex-start;
    margin-top: 100px;
    height: 80vh;
  }
}

@media screen and (max-width: 600px) {
  div.container{
    display: flex;
    flex-flow: column wrap;
    justify-content: flex-start;
    padding: 0 ;
    margin: 0;
    align-items: flex-start;
;
  }
}

@media screen and (min-width: 601px) {
div.item {
  width: 50%;
 }
}

@media screen and (max-width: 600px) {
div.item {
  height:40%;
  width: 80%;
  margin-bottom: 10%;
 }
}

img{
  width: 90%;
  filter: drop-shadow(0px 0px 10px rgb(90, 89, 89));
}


</style>

<template>
<div class="container">
  <div class="item">
    <div class="mainText">About Us</div>
    <br>
    <p>Flagoff was created with the goal of improving current state flags. Today, very few Americans can successfully identify which state 
      each flag represents. Some state flags have aged poorly and others display images too complex to be seen from a distance. I hope that with this ranking
      system to generate greater interest in U.S. state flags and create their own design. </p>
    <br>
    <p>To contact or submit your own state flag design for ranking, please email flagoff@gmail.com</p>
  </div>
  <div class="item">
    <img src="/assets/Flag-map.svg">
  </div>
</div>
</template>