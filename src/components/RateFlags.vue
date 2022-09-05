<style scoped>
@import '../assets/base.css';

img{
  width: 100%;
  filter: drop-shadow(0px 0px 10px rgb(90, 89, 89));
}

img:hover {
  cursor: pointer;
  filter: drop-shadow(0px 0px 10px rgb(0, 0, 0));
}

div.mainText {
  padding-left: 10px;
  padding-top: 20px;
  padding-bottom: 20px;
  color:black;
}


@media screen and (min-width: 601px) {
  div.mainText{
    font-size: 30px;
    color:black;
  }
}

@media screen and (max-width: 600px) {
  div.mainText {
    font-size: 17px;
    color:black;
  }
}

@media screen and (min-width: 601px) {
  div.container {
    display: flex;
    flex-flow: row wrap;
    justify-content: space-around;
    align-items: center;
    padding: 0;
    margin: 0;
    height: 80vh;
  }
}

@media screen and (max-width: 600px) {
  div.container{
    display: flex;
    flex-flow: column wrap;
    justify-content: space-around;
    padding: 0 ;
    margin: 0;
    align-items: center;
  }
}

@media screen and (min-width: 601px) {
div.item {
  width: 40%;
 }
}

@media screen and (max-width: 600px) {
div.item {
  height:40%;
  width: 80%;
 }
}

img{
  width: 100%;
  filter: drop-shadow(0px 0px 10px rgb(90, 89, 89));
}

#overlay {
  position: fixed; /* Sit on top of the page content */
  display: none; 
  width: 100%;
  height: 100%; 
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.75); /* Black background with opacity */
  z-index: 2; /* Specify a stack order in case you're using a different order for other elements */
  cursor: pointer; /* Add a pointer on hover */
}

@media screen and (min-width: 601px) {
  #overlay_text{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 35px;
    text-align: center;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
  }
}

@media screen and (max-width: 600px) {
  #overlay_text{
    position: absolute;
    top: 50%;
    left: 50%;
    font-size: 20px;
    text-align: center;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
  }
}
#overlay_text2{
  color: lightblue;

}
</style>


<script>


const STATES = new Array("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida",
                      "Georgia", "Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine", "Maryland",
                      "Massachusetts", "Michigan","Minnesota", "Mississippi","Missouri","Montana","Nebraska","Nevada","New_Hampshire",
                      "New_Jersey","New_Mexico","New_York","North_Carolina","North_Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
                      "Rhode_Island","South_Carolina","South_Dakota", "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
                      "West_Virginia","Wisconsin","Wyoming");

const BASEAPI = "https://kqarm5rtcjay35c3agt7rw2zdq0wqvus.lambda-url.us-east-2.on.aws/";


async function recordMatch(flag1,flag2,winner){
  const url = `${BASEAPI}record-Match`
  const data = {flag1, flag2, winner}
  const response = await fetch(url, {
    method: 'POST',
    body: JSON.stringify(data)}
  )

}

async function api(){
  const response = await fetch(BASEAPI);
  const data = await response.json();
  console.log(data);
}

function changeFlag(winner) {
    
    const [name1, name2] = getFlagPair();
    this.count = this.count + 1;
    
    let former1, former2;
    if (this.showFirst) {
      former1 = this.Flag1;
      former2 = this.Flag2;
      this.Flag1 = name1;
      this.Flag2 = name2;
    }  
    else {
      former1 = this.Flag3;
      former2 = this.Flag4;
      this.Flag3 = name1;
      this.Flag4 = name2;
    }
    this.set.add(former1);
    this.set.add(former2);
    console.log(this.set);
    console.log(this.count);
    recordMatch(former1,former2,winner);
    this.showFirst = !this.showFirst;
    if (this.count%10==0 && this.set.size!=50){
      this.message = "You have completed "+(this.count)+ " matches and ranked "+(this.set.size)+" unique flags! ";
      this.showPopUp=true;
    }
    else if ((this.set).size== 50) {
      this.message = "You've ranked all of the flags! Thank you for your participation! "
      this.showPopUp=true;
    }
}

function popupOff(){
  this.showPopUp = false;
}

function dynamicStyling(){
  if(this.showPopUp){
    return {display:"block"};
  }
  else{
    return {display:"none"};
  }
}

function getRndInt(min,max){
  return Math.floor(Math.random()*(max-min))+min;
}

function getFlagPair(){
  let num1 = 0;
  let num2 = 0;
  while (num1 == num2){
    num1 = getRndInt(0,STATES.length);
    num2 = getRndInt(0,STATES.length);
  }  
  return [STATES[num1],STATES[num2]];
}


export default {
  data() {
    const [Flag1, Flag2] = getFlagPair();
    const [Flag3, Flag4] = getFlagPair();
    return {
      Flag1,
      Flag2,
      Flag3,
      Flag4,
      showFirst: true,
      count: 0,
      set: new Set(),
      message:"",
      showPopUp: false
    }
  },
  name: 'RateFlags',
  computed: {
    dynamicStyling
  },
  methods: {
      changeFlag,
      popupOff
  },
}

</script>

<template>

<div class="mainText">Select your preferred flag.</div>


<div class="container">
  <div class="item">
    <img :src="`/assets/flags/Flag_of_${Flag1}.svg`" id="Flag1" :onclick="() => changeFlag(Flag1)" :hidden="!showFirst">
    <img :src="`assets/flags/Flag_of_${Flag3}.svg`" id="Flag3" :onclick="() => changeFlag(Flag3)" :hidden="showFirst">   
  </div>
  <div class="item">
    <img :src="`/assets/flags/Flag_of_${Flag2}.svg`" id="Flag2" :onclick="() => changeFlag(Flag2)" :hidden="!showFirst">
    <img :src="`assets/flags/Flag_of_${Flag4}.svg`" id="Flag4" :onclick="() => changeFlag(Flag4)" :hidden="showFirst">
  </div>
</div>
<div id="overlay" :onclick="() => popupOff()" :style="dynamicStyling">
  <div id="overlay_text" > {{this.message}} Click anywhere to continue ranking or <router-link id="overlay_text2" to="/current-rankings">view</router-link> the overall flag rankings.</div>
</div> 

</template>
