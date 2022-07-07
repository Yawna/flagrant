<script>

let states = new Array("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida",
                      "Georgia", "Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine", "Maryland",
                      "Massachusetts", "Michigan","Minnesota", "Mississippi","Missouri","Montana","Nebraska","Nevada","New_Hampshire",
                      "New_Jersey","New_Mexico","New_York","North_Carolina","North_Dakota","Ohio","Oklahoma","Oregon","Pennsylvania",
                      "Rhode_Island","South_Carolina","South_Dakota", "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
                      "West_Virginia","Wisconsin","Wyoming");



function changeFlag() {
    let num1 = 0;
    let name1 = "";
    let num2 = 0;
    let name2 = "";
    let prevFlag1 = this.Flag1;
    let prevFlag2 = this.Flag2;

    num1 = getRndInt(0,states.length);
    num2 = getRndInt(0,states.length);
    while (num1 == num2 || prevFlag1.localeCompare(states[num1]) == 0 || prevFlag2.localeCompare(states[num2])== 0){
      num1 = getRndInt(0,states.length);
      num2 = getRndInt(0,states.length);
    } 
    name1 = states[num1];
    name2 = states[num2];
    this.Flag1 = name1;
    this.Flag2 = name2;
}

function getRndInt(min,max){
  return Math.floor(Math.random()*(max-min))+min;
}

export default {
  data() {
    return {
      Flag1: 'Delaware',
      Flag2:'Pennsylvania'
    }
  },
  name: 'HelloWorld',
  methods: {
      changeFlag,
      getRndInt
  },
  var:
    states
}

</script>
<style>
@import '../assets/base.css';



</style>

<template>
<p></p>
 <h3>
    Select your preferred flag.
 </h3>
 <p></p>


<div class="container-lp">
    <div class="col-2-lp">
        <img :src="`/assets/flags/Flag_of_${Flag1}.svg`" id="Flag1" :onclick="changeFlag">
    </div>
    <div class="col-2-lp last-lp">
        <img :src="`/assets/flags/Flag_of_${Flag2}.svg`" id="Flag2" :onclick="changeFlag">
    </div>
</div>


</template>
