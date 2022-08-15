import { createApp } from 'vue'
import App from './App.vue'
import {createRouter,createWebHistory} from "vue-router"
import RateFlags from './components/RateFlags.vue'
import OverAllRankings from './components/OverAllRankings.vue'
import About from './components/About.vue'


const routes = [
  { path: '/', component: RateFlags },
  { path: '/current-rankings', component: OverAllRankings },
  { path: '/about', component: About}
]

const router = createRouter({
  history: createWebHistory(),
  routes, 
})
  
const app = createApp(App)

app.use(router)

app.mount('#app')
  