<style scoped>

img{
  height: 90%;
  width: auto;
  filter: drop-shadow(0px 0px 10px rgb(90, 89, 89));

}

div.mainText {
  padding-left: 10px;
  padding-top: 20px;
  padding-bottom: 5px;
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
    font-size: 15px;
    color:black;
  }
}

@media screen and (min-width: 601px) {
  div.mainText2{
    font-size: 25px;
    color:black;
  }
}

@media screen and (max-width: 600px) {
  div.mainText2 {
    font-size: 15px;
    color:black;
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

</style>

<script>

const STATES = new Array("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida",
                      "Georgia", "Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine", "Maryland",
                      "Massachusetts", "Michigan","Minnesota", "Mississippi","Missouri","Montana","Nebraska","Nevada","New_Hampshire",
                      "New_Jersey","New_Mexico","New_York","North_Carolina","North_Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
                      "Rhode_Island","South_Carolina","South_Dakota", "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
                      "West_Virginia","Wisconsin","Wyoming");

const BASEAPI = "https://kqarm5rtcjay35c3agt7rw2zdq0wqvus.lambda-url.us-east-2.on.aws/";


async function get_the_data(){
  const url = `${BASEAPI}overall-Results`
  const response = await fetch(url, {
    method: 'GET'}
  )
  this.the_goods = (await response.json()).results
}



export default {
  data() {
    return {
      the_goods: [],
    }
  },
  methods: {
    get_the_data
  },
  mounted(){
    this.get_the_data()
  }
}

</script>
<style>
@import '../assets/base.css';



</style>

<template>
<div class="mainText">Current State Flag Rankings</div>
  <div v-for="(good, index) in the_goods" class="container2">
    <div class="item2b">
      <div class="mainText2"> 
        <p>{{index+1}}. {{(good.state).replace("_"," ")}}</p> 
        <p> Rating: {{Number((good.elo_rating).toFixed(1))}}</p> 
      </div>
    </div>
    <div class="item2"> 
      <img :src="`/assets/flags/Flag_of_${good.state}.svg`" >
    </div>
  </div>


</template>