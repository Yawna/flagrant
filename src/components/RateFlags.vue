
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
}


@media screen and (min-width: 601px) {
  div.mainText{
    font-size: 30px;
  }
}

@media screen and (max-width: 600px) {
  div.mainText {
    font-size: 17px;
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
    former1 = this.Flag1;
    former2 = this.Flag2;
    if (this.Flag1 == winner){
      this.Flag2 = this.Flag4;
    }
    else{
      this.Flag1 = this.Flag3;
    }
    this.markOff(former1,former2);
    this.Flag3 = this.getNewRndFlag(this.Flag2);
    this.Flag4 = this.getNewRndFlag(this.Flag1);
    console.log(this.Flag3);
    console.log(this.Flag4);
    if (this.Flag3 == null || this.Flag4 == null){
      let num = getRndInt(0,50);
      while(this.the_map.get(STATES[num]).size === 0){
        num = getRndInt(0,50);
        console.log(STATES[num]);
        console.log(this.the_map.get(STATES[num]));
      }
      let arrayFromSet =  Array.from(this.the_map.get(STATES[num]))
      let num2 = getRndInt(0,arrayFromSet.length);
      this.Flag3 = STATES[num];
      this.Flag4 = arrayFromSet[num2];
    }
    
    this.set.add(former1);
    this.set.add(former2);
    recordMatch(former1,former2,winner);

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

function getNewRndFlag(state_name){
  let state = this.the_map.get(state_name);
  if (state.size == 0){
    return null;
  }
  let num1 = getRndInt(0,state.size);
  while (!state.has(STATES[num1])){
    console.log("I'm stuck");
    num1 = getRndInt(0,state.size);
  }  
  return STATES[num1];
}

function markOff(state1,state2){
  ((this.the_map).get(state1)).delete(state2);
  ((this.the_map).get(state2)).delete(state1);
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

function getFlagSet(){
  let num1 = 0;
  let num2 = 0;
  let num3 = 0;
  let num4 = 0;
  while (num1 == num2 || num1 == num3 || num1 == num4 || num2 == num3 || num2 == num4 ||num3 == num4 ){
    num1 = getRndInt(0,STATES.length);
    num2 = getRndInt(0,STATES.length);
    num3 = getRndInt(0,STATES.length);
    num4 = getRndInt(0,STATES.length);

  }
  return [STATES[num1],STATES[num2],STATES[num2],STATES[num3], STATES[num4]];
}

function makeList(){
  const my_map = new Map();
  let state_set = new Set(["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida",
                      "Georgia", "Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine", "Maryland",
                      "Massachusetts", "Michigan","Minnesota", "Mississippi","Missouri","Montana","Nebraska","Nevada","New_Hampshire",
                      "New_Jersey","New_Mexico","New_York","North_Carolina","North_Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
                      "Rhode_Island","South_Carolina","South_Dakota", "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
                      "West_Virginia","Wisconsin","Wyoming"])
  for (let item in STATES){
    state_set.delete(STATES[item]);
    my_map.set(STATES[item], new Set(JSON.parse(JSON.stringify(Array.from(state_set)))));
    state_set.add(STATES[item]);
  }
  return my_map;
}


export default {
  data() {
    const [Flag1, Flag2] = getFlagPair();
    const [Flag3, Flag4] = getFlagPair();
    //const [Flag1,Flag2,FlagA,FlagB,FlagC] = getFlagSet();
    const the_map = makeList();
    return {
      the_map,
      Flag1,
      Flag2,
      Flag3,
      Flag4,
      showFirst: true,
      showA: false,
      showB: true,
      showC: true,
      count: 0,
      letter: "A",
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
      popupOff,
      makeList,
      markOff,
      getNewRndFlag
  },
}

</script>

<template>

<div class="mainText">Select your preferred flag.</div>


<div class="container">
  <div class="item">
    <img :src="`/assets/flags/Flag_of_${Flag1}.svg`" :onclick="() => changeFlag(Flag1)">
    <img :src="`assets/flags/Flag_of_${Flag3}.svg`" hidden>   
  </div>
  <div class="item">
    <img :src="`/assets/flags/Flag_of_${Flag2}.svg`" :onclick="() => changeFlag(Flag2)" >
    <img :src="`assets/flags/Flag_of_${Flag4}.svg`" hidden>
  </div>
</div>
<div id="overlay" :onclick="() => popupOff()" :style="dynamicStyling">
  <div id="overlay_text" > {{this.message}} Click anywhere to continue ranking or <router-link id="overlay_text2" to="/current-rankings">view</router-link> the overall flag rankings.</div>
</div> 

</template>
