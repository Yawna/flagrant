<style>
@import '../assets/base.css';
img:hover {
  cursor: pointer;
  filter: drop-shadow(0px 0px 10px rgb(0, 0, 0));
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
    recordMatch(former1,former2,winner);
    this.showFirst = !this.showFirst;
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
    }
  },
  name: 'HelloWorld',
  methods: {
      changeFlag
  },
}

</script>
<style>
@import '../assets/base.css';



</style>

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


</template>
